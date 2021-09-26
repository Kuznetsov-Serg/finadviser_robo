"""
    Telegram event handlers
"""
import collections
import json
# import os
# import types

import telegram
from apiai import apiai
# from django.http import HttpResponse
from telegram import ReplyMarkup, ReplyKeyboardMarkup
from telegram.ext import (
    Updater, Dispatcher, Filters,
    CommandHandler, MessageHandler,
    InlineQueryHandler, CallbackQueryHandler,
    ChosenInlineResultHandler,
)
# import dialogflow
# import dialogflow_v2 as dialogflow

from celery.decorators import task  # event processing in async mode

from finadviser.settings import TELEGRAM_TOKEN

from tgbot.handlers import admin, commands, files, location, dialog_flow
from tgbot.handlers.commands import broadcast_command_with_message
from tgbot.handlers.handlers import secret_level, broadcast_decision_handler
from tgbot.handlers.manage_data import SECRET_LEVEL_BUTTON, CONFIRM_DECLINE_BROADCAST
from tgbot.handlers.static_text import broadcast_command
from tgbot.handlers.dialog_flow import dialog_flow
from tgbot.handlers.dialog_flow import Message



def setup_dispatcher(dp):
    """
    Adding handlers for events from Telegram
    """

    dp.add_handler(CommandHandler("start", commands.command_start))

    # admin commands
    dp.add_handler(CommandHandler("admin", admin.admin))
    dp.add_handler(CommandHandler("stats", admin.stats))

    dp.add_handler(MessageHandler(Filters.animation, files.show_file_id,))

    # location
    dp.add_handler(CommandHandler("ask_location", location.ask_for_location))
    dp.add_handler(MessageHandler(Filters.location, location.location_handler))


    dp.add_handler(CallbackQueryHandler(secret_level, pattern=f"^{SECRET_LEVEL_BUTTON}"))

    dp.add_handler(MessageHandler(Filters.regex(rf'^{broadcast_command} .*'), broadcast_command_with_message))
    dp.add_handler(CallbackQueryHandler(broadcast_decision_handler, pattern=f"^{CONFIRM_DECLINE_BROADCAST}"))

    dp.add_handler(MessageHandler(Filters.text, parrot))     # обработчкик текстового сообщения

    #EXAMPLES FOR HANDLERS
    # dp.add_handler(MessageHandler(Filters.text, <function_handler>))
    # dp.add_handler(MessageHandler(
    #     Filters.document, <function_handler>,
    # ))
    # dp.add_handler(CallbackQueryHandler(<function_handler>, pattern="^r\d+_\d+"))
    # dp.add_handler(MessageHandler(
    #     Filters.chat(chat_id=int(TELEGRAM_FILESTORAGE_ID)),
    #     # & Filters.forwarded & (Filters.photo | Filters.video | Filters.animation),
    #     <function_handler>,
    # ))

    return dp


def run_pooling():
    """ Run bot in pooling mode """

    bot = DialogBot(TELEGRAM_TOKEN, None)
    bot.start()
    return

    updater = Updater(TELEGRAM_TOKEN, use_context=True)

    dp = updater.dispatcher
    dp = setup_dispatcher(dp)

    bot_info = telegram.Bot(TELEGRAM_TOKEN).get_me()
    bot_link = f"https://t.me/" + bot_info["username"]

    print(f"Pooling of '{bot_link}' started")
    updater.start_polling()
    updater.idle()

def parrot(bot, update):
    bot.message.reply_text(f'Уважаемый {bot.message.chat.first_name}, на Ваше сообщения я отвечу тем-же:\n{bot.message.text}')
    print(bot.message.text)
    # Serg_Kuznetsov - 178698488
    # Kuznetsova - 908549155
    # broadcast_command_with_message(('178698488', '908549155'), )

    update.bot.send_message(
        text=bot.message.text,
        chat_id='908549155',
        parse_mode=telegram.ParseMode.MARKDOWN,
        # reply_markup=markup
    )

    # user_id = bot.message.chat.id
    # bot.send_message(bot.message.from_user.id, 'текст')
    # Updater.bot.send_message(bot.message.chat.id, 'А это отдельная строка ...')
    # bot.send_message(bot.message.chat.id, 'А это отдельная строка ...')

@task(ignore_result=True)
def process_telegram_event(update_json):
    update = telegram.Update.de_json(update_json, bot)
    dispatcher.process_update(update)


# Класс Dialog_Flow (https://habr.com/ru/post/316666/)
class DialogBot(object):

    def __init__(self, token, generator):
        self.generator = generator
        self.updater = Updater(token=token, use_context=True)       # заводим апдейтера

        self.updater.dispatcher.add_handler(CommandHandler("start", commands.command_start))
        # admin commands
        self.updater.dispatcher.add_handler(CommandHandler("admin", admin.admin))
        self.updater.dispatcher.add_handler(CommandHandler("stats", admin.stats))

        self.updater.dispatcher.add_handler(MessageHandler(Filters.animation, files.show_file_id,))

        # location
        self.updater.dispatcher.add_handler(CommandHandler("ask_location", location.ask_for_location))
        self.updater.dispatcher.add_handler(MessageHandler(Filters.location, location.location_handler))


        self.updater.dispatcher.add_handler(CallbackQueryHandler(secret_level, pattern=f"^{SECRET_LEVEL_BUTTON}"))

        self.updater.dispatcher.add_handler(MessageHandler(Filters.regex(rf'^{broadcast_command} .*'), broadcast_command_with_message))
        self.updater.dispatcher.add_handler(CallbackQueryHandler(broadcast_decision_handler, pattern=f"^{CONFIRM_DECLINE_BROADCAST}"))

        handler = MessageHandler(Filters.text | Filters.command, self.handle_message)
        self.updater.dispatcher.add_handler(handler)  # ставим обработчик всех текстовых сообщений
        self.handlers = collections.defaultdict(self.generator)  # заводим мапу "id чата -> генератор"


    def start(self):
        """ Run bot in pooling mode """
        self.bot_info = telegram.Bot(TELEGRAM_TOKEN).get_me()
        bot_link = f"https://t.me/" + self.bot_info["username"]
        print(f"Pooling of '{bot_link}' started")

        self.updater.start_polling()    # Начинаем поиск обновлений
        self.updater.idle()             # Останавливаем бота, если были нажаты Ctrl + C


    def handle_message(self, bot, update):
        print("Received", bot.message.text)
        chat_id = bot.message.chat_id
        if bot.message.text == "/start":
            # если передана команда /start, начинаем всё с начала -- для
            # этого удаляем состояние текущего чатика, если оно есть
            self.handlers.pop(chat_id, None)

        if chat_id not in self.handlers:    # начало общения
            self.handlers[chat_id] = 'default_dialog_flow'      # значит, запустим Google DialogFlow

        # в получаемом кортеже может смениться активный DialogFlow (команды)
        answer, self.handlers[chat_id] = dialog_flow(function_or_generator=self.handlers[chat_id], chat_id=chat_id,
                                                     username=bot.message.chat.first_name, text=bot.message.text)
        # отправляем полученный ответ пользователю
        self._send_answer(bot, chat_id, answer)


    def _send_answer(self, bot, chat_id, answer):
        print("Sending answer %r to %s" % (answer, chat_id))
        if answer == '':                    # Google не всегда отвечает
            return
        if isinstance(answer, collections.abc.Iterable) and not isinstance(answer, str):
            # мы получили несколько объектов -- сперва каждый надо обработать
            answer = list(map(self._convert_answer_part, answer))
        else:
            # мы получили один объект -- сводим к более общей задаче
            answer = [self._convert_answer_part(answer)]

        # перед тем, как отправить очередное сообщение, идём вперёд в поисках
        # «довесков» -- клавиатуры там или в перспективе ещё чего-нибудь
        current_message = None
        for part in answer:
            if isinstance(part, Message):
                if current_message is not None:
                    # поскольку не все объекты исчерпаны, пусть это сообщение
                    # не вызывает звоночек (если не указано обратное)
                    options = dict(current_message.options)
                    options.setdefault("disable_notification", True)
                    # bot.sendMessage(chat_id=chat_id, text=current_message.text, **options)
                    bot.message.reply_text(text=current_message.text, **options)
                current_message = part
            if isinstance(part, ReplyMarkup):
                # ага, а вот и довесок! добавляем текущему сообщению.
                # нет сообщения -- ну извините, это ошибка.
                current_message.options["reply_markup"] = part
        # надо не забыть отправить последнее встреченное сообщение.
        if current_message is not None:
            # bot.sendMessage(chat_id=chat_id, text=current_message.text, **current_message.options)
            bot.message.reply_text(text=current_message.text, **current_message.options)

    def _convert_answer_part(self, answer_part):
        if isinstance(answer_part, str):
            return Message(answer_part)
        if isinstance(answer_part, collections.abc.Iterable):
            # клавиатура?
            answer_part = list(answer_part)
            if isinstance(answer_part[0], str):
                # она! оформляем как горизонтальный ряд кнопок.
                # кстати, все наши клавиатуры одноразовые -- нам пока хватит.
                return ReplyKeyboardMarkup([answer_part], one_time_keyboard=True)
            elif isinstance(answer_part[0], collections.abc.Iterable):
                # двумерная клавиатура?
                if isinstance(answer_part[0][0], str):
                    # она!
                    return ReplyKeyboardMarkup(map(list, answer_part), one_time_keyboard=True)
        return answer_part


def textMessage(bot, update):
    request = apiai.ApiAI('ВАШ API ТОКЕН').text_request() # Токен API к Dialogflow
    request.lang = 'ru' # На каком языке будет послан запрос
    request.session_id = 'BatlabAIBot' # ID Сессии диалога (нужно, чтобы потом учить бота)
    request.query = update.message.text # Посылаем запрос к ИИ с сообщением от юзера
    responseJson = json.loads(request.getresponse().read().decode('utf-8'))
    response = responseJson['result']['fulfillment']['speech'] # Разбираем JSON и вытаскиваем ответ
    # Если есть ответ от бота - присылаем юзеру, если нет - бот его не понял
    if response:
        bot.send_message(chat_id=update.message.chat_id, text=response)
    else:
        bot.send_message(chat_id=update.message.chat_id, text='Я Вас не совсем понял!')


# Старый вариант без Dialog_Flow
# Global variable - best way I found to init Telegram bot
# bot = telegram.Bot(TELEGRAM_TOKEN)
# dispatcher = setup_dispatcher(Dispatcher(bot, None, workers=0, use_context=True))
# TELEGRAM_BOT_USERNAME = bot.get_me()["username"]

bot = DialogBot(TELEGRAM_TOKEN, None)
bot.start()
dispatcher = setup_dispatcher(Dispatcher(bot, None, workers=0, use_context=True))
