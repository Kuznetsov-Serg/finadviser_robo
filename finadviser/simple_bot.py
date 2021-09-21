from telegram.ext import Updater, CommandHandler, MessageHandler, Filters

# Вызывается при отправке пользователем команды /start
def sms(bot, update):
    print('Кто-то отправил команду /start')
    bot.message.reply_text(f'Здравствуйте {bot.message.chat.first_name}, я Бот! \n'
                           f'Я пока тупой, но скоро это исправят.\n'
                           f'Давайте пообщаемся?')
    print(bot.message)

# Отвечает тем-же сообщением, что и получено (попугай)
def parrot(bot, update):
    bot.message.reply_text(f'Уважаемый {bot.message.chat.first_name}, на Ваше сообщения я отвечу тем-же:\n{bot.message.text}')
    print(bot.message.text)
    # Serg_Kuznetsov - 178698488
    # Kuznetsova - 908549155
    user_id = bot.message.chat.id
    bot.send_message(bot.message.from_user.id, 'текст')
    # Updater.bot.send_message(bot.message.chat.id, 'А это отдельная строка ...')
    # bot.send_message(bot.message.chat.id, 'А это отдельная строка ...')

# Основная функция для соединения с Telegram
def main():
    my_bot = Updater("1936751032:AAGC1OcT_NiqHfzPAYFIAOoFLTBvtSwdO9U", use_context=True)
    # my_bot = Updater("1936751032:AAGC1OcT_NiqHfzPAYFIAOoFLTBvtSwdO9U", "https://telegg.ru/orig/bot", use_context=True)
    # my_bot = Updater("1936751032:AAGC1OcT_NiqHfzPAYFIAOoFLTBvtSwdO9U", "https://6094-5-149-159-29.ngrok.io/", use_context=True)

    # dispatcher принимает сообщение от Telegram, add_handler - отправляет в CommandHandler
    my_bot.dispatcher.add_handler(CommandHandler('start', sms))             # обработчик команды /start
    my_bot.dispatcher.add_handler(MessageHandler(Filters.text, parrot))     # обработчкик текстового сообщения

    my_bot.start_polling()      # проверяет наличие сообщений на Telegram
    my_bot.idle()               # Бот будет работать пока его не остановят



main()