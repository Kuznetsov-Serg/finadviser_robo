# Генератор Dialog_Flow

from collections import Iterable
from functools import reduce

from cronlog import basestring
from django.shortcuts import get_object_or_404

from tgbot.models import User
from mainapp.models import ProductCategory, Product
from portfolioapp.models import Portfolio

'''
*********************************************************************
Основной блок Dialog-Flow
*********************************************************************
'''
def dialog_flow(username=None):
    answer = yield (HTML(f"Привет <b>{username}</b>, я - Робо :)\n" \
                         "Твой помощник в сфере финансов, а также твоя моральная поддержка 24/7\n" \
                         f"Будем знакомы.\nКак лучше к тебе обращаться?\n"), [username])

    # убираем ведущие знаки пунктуации, оставляем только
    # первую компоненту имени, пишем её с заглавной буквы
    username = answer.text.rstrip(".!").split()[0].capitalize()
    answer, choice = yield from ask_yes_or_no(HTML(f"<b>{username}</b>, супер\n" \
                                                   "Со мной ты создашь капиталы без лишних\n" \
                                                   "стрессов и нервяков; страшных рисков и потерь.\n" 
                                                   "И вообще, тебя есть с чем поздравить!\n" \
                                                   "Ты уже на шаг ближе к жизни мечты, нежели другие. Почему?\n" \
                                                   "Инвестирование - самый короткий путь к финансовой независимости.\n" \
                                                   "Если это и есть твоя главенствующая цель,\n" \
                                                   "напиши ДА!\n" \
                                                   "Если ты зашел на канал, чтобы просто развлечься,\n" \
                                                   "общаясь с искусственным интеллектом и узнать новое про финансы,\n" \
                                                   "напиши НЕТ. "))
    if choice:
        answer = yield from choice_1_yes(username)
    else:
        answer = yield "Жаль."
    return answer


def choice_1_yes(username):
    answer, choice = yield from ask_list_answer(HTML(f"Что ж, я уверен, мы с тобой подружимся <b>{username}!</b>\n" \
                                                     "Тоже считаю, что не стоит тратить жизнь на то, что не нравится.\n" \
                                                     "Я за воплощение мечты детства и реализацию целей.\n" \
                                                     "Поэтому давай сразу к делу?\n" \
                                                     "Пиши \"вперёд\".\nБез лишних разговоров. Ведь время то идет.."),
                                                ['вперед  ✅', 'не сейчас  ❌', 'в другой раз'])

    if choice == 0:
        answer = yield from choice_2_yes(username)
    else:
        answer = yield from choice_2_bad(username)
    return answer


def choice_2_bad(username):
    answer = yield from ask_yes_or_no(
        HTML(f"Ай-яй-яй. <b>{username}</b>, фу таким быть! Что именно вам так не нравится?\n"
             "Ваша позиция имеет право на существование. Деньги Вы тоже не хотите зарабатывать?"))
    if answer:
        answer = yield "Ну и ладно."
    else:
        answer = yield "Что «нет»? «Нет, не хотите» или «нет, хотите»?"
        answer = yield "Спокойно, это у меня юмор такой."
    return answer


def choice_2_yes(username):
    answer, choice = yield from ask_list_answer(HTML(f"Отлично <b>{username}</b>\n" \
                                                     "Самое главное сейчас. Скажи, у тебя есть брокерский счет?\n" \
                                                     "Без него нам не начать действовать."),
                                                ['да  ✅', 'есть', 'нет  ❌'])
    if choice <= 1:
        answer = answer = yield "Ну и ладно."
    else:
        answer = yield from choice_3_no(username)
    return answer


def choice_3_no(username):
    choice = yield from ask_yes_or_no("Все ок. Давай  дам тебе информацию о брокерах,\n" \
                                      "которым можно доверять?  Условия и фишки.")
    if choice:
        answer = yield from choice_4_yes(username)
    else:
        answer = yield "Ну и ладно."
    return answer


def choice_4_yes(username):
    answer, choice = yield from ask_list_answer(f"{username}.\n" \
                                                "Исходя из того, что мы обсудили, лучший брокер для тебя - Тинькофф.\n" \
                                                "\n" \
                                                "Фишка: открытие и закрытие счета - бесплатно!\n" \
                                                "А условия по комиссии вполне приемлемые:\n" \
                                                "0,3%  (99₽/мес или 50 тыс₽).\n" \
                                                "0,05% (290₽/мес  или 2 мил₽).\n" \
                                                "0,025% (3000₽/мес или 3 мил₽).\n" \
                                                "\n" \
                                                "Обслуживание счета в месяц - 0₽.\n" \
                                                "Напиши \"перейти на сайт брокера\" и там следуй указаниям на сайте.\n" \
                                                "А после - возвращайся! У меня для тебя есть полезный контент)) ")

    return answer

'''
*********************************************************************
Блок отвечает за заполнение Портфолио Клиента финансовыми продуктами
*********************************************************************
'''
def dialog_flow_portfolio(chat_id=None):
    user = get_object_or_404(User, user_id=chat_id)  # профиль Клиента

    before_answer_bot = ''
    while True:
        choice = yield from choice_portfolio_main_menu(user, before_answer_bot)
        before_answer_bot = ''
        if choice == 0:
            before_answer_bot = choice_portfolio_list(user)
        elif choice == 1:
            choice = yield from choice_portfolio_add_product(user)
        elif choice == 2:
            choice = yield from choice_portfolio_del_product(user)
        else:
            break
    return

# Главное меню блока Портфолио
def choice_portfolio_main_menu(user, before_answer_bot=''):
    if before_answer_bot != '':
        before_answer_bot += '\n\n'
    answer, choice = yield from ask_list_answer(HTML(f"{before_answer_bot}<b>{user.first_name}</b>,\n" \
                                                     "предлагаю выбрать дальнейшие действия с фин. продуктами?"),
                                                ['просмотр портфеля', 'добавить', 'удалить ❌', 'завершить работу'])
    return choice

# Просмотр содержимого Портфолио Клиента
def choice_portfolio_list(user):
    products = get_products_in_portfolio(user)
    answer = '\n'.join(list(map(lambda x: x.name, products)))
    # answer = yield HTML(f'{user.first_name}, состав Вашего портфеля:\n {answer}')
    # return
    # return answer.text
    return f'{user.first_name}, состав Вашего портфеля:\n {answer}'

# Dialog-Flow добавления продукта в Портфолио Клиента
def choice_portfolio_add_product(user):
    flag_exit = False
    while not flag_exit:
        category = yield from choice_product_category(user)
        if category == False:
            break
        while True:
            product = yield from choice_product(user, category)
            if product == False:
                break
            # дополним список продуктов у Клиента в его Portfolio
            portfolio = Portfolio(user=user, product=product)
            portfolio.save()

            answer, choice = yield from ask_list_answer(HTML(f"Добавил в Ваше портфолио <b>{product.name}</b>, продолжаем?"),
                                                        ['в текущей категории', 'в др. категории', 'завершаем ❌'])
            if choice == 1:
                break
            elif choice == 2:
                flag_exit = True
                break
    return


# Dialog-Flow удаления продукта из Портфолио Клиента
def choice_portfolio_del_product(user):
    products = get_products_in_portfolio(user)
    list_answer = list(map(lambda x: [x.name], products))
    list_answer.append(['⚠️ выйти без удаления ⚠️'])

    answer, choice = yield from ask_list_answer(HTML(f"<b>{user.first_name}</b>, просьба выбрать прроодукт для удаления "
                                                     'из портфолил, или нажать "ВЫЙТИ"'), list_answer)
    if choice >= len(products):
        return False
    else:
        product = products[choice]
        portfolio = get_object_or_404(Portfolio, user=user, product=product, is_active=True)
        portfolio.is_active = False
        portfolio.save()
        return f'Удалили {list_answer[choice]}'

def choice_product_category(user):
    # Блок выбора категории фин.продукта
    categories = get_categories_not_all_products_in_portfolio(user)
    list_answer = list(map(lambda x: [x.name], categories))
    list_answer.append(['завершить работу с фин. продуктами ❌'])
    answer, choice = yield from ask_list_answer(HTML(f"<b>{user.first_name}</b>,\n" \
                                                     "давай выберем интересные, для тебя, финансовые инструменты.\n" \
                                                     "Определись с категорией?"), list_answer)
    if choice >= len(categories):
        return False
    else:
        return categories[choice]


def choice_product(user, category):
    # В варианты ответов поместим активные фин. продукты выбранной категории, исключая уже имеющиеся в portfolio
    products = get_product_in_category_not_in_portfolio(user, category)
    list_answer = list(map(lambda x: [x.name], products))
    list_answer.append(['завершить работу с фин. продуктами ❌'])
    answer, choice = yield from ask_list_answer(HTML(f"<b>{user.first_name}</b>, \n" \
                                                     "определись с финансовым инструментом?"),
                                                list_answer)
    if choice >= len(products):
        return False
    else:
        return products[choice]


'''
*********************************************************************
Блок универсальных вопросов-ответов
*********************************************************************
'''
def ask_yes_or_no(question):
    """Спросить вопрос и дождаться ответа, содержащего «да» или «нет».
    Возвращает:
        bool
    """
    # return ask_list_answer(question)
    answer = yield (question, ["Да ✅", "Нет ❌"])
    while not ("да" in answer.text.lower() or "нет" in answer.text.lower()):
        answer = yield HTML("Так <b>да</b> или <b>нет</b>?")
    return "да" in answer.text.lower()


def ask_list_answer(question, list_answer):
    """Спросить вопрос и дождаться ответ, из список вариантов.
    Возвращает:
        number
    """
    answer = yield (question, list_answer)
    list_answer = list(flatten_lower(list_answer))  # избавимся от вложенности в массиве и переведем в lower
    while not (answer.text.lower() in list_answer):
        answer = yield HTML("Прошу ввести вариант или нажать кнопку?")
    return answer.text, list_answer.index(answer.text.lower())


def ask_list_answer1(question, list_yes=['да', 'ок', 'yes', 'ok'], list_no=['нет', 'not']):
    """Спросить вопрос и дождаться ответа, содержащегоcя в списке list_yes или list_no

    Возвращает:
        bool
    """
    answer = yield question
    while not (answer.text.lower() in list_yes or answer.text.lower() in list_no):
        answer = yield HTML(
            "Так все-же, выберете?\n(<b>" + ', '.join(list_yes) + "</b>)\nили\n(<b>" + ', '.join(list_no) + "</b>)")
    return answer.text.lower() in list_yes


# Функция разворачивания списка любой вложенности с переводом текста в нижний регистр
def flatten_lower(list):
    for item in list:
        if isinstance(item, Iterable) and not isinstance(item, basestring):
            for x in flatten_lower(item):
                yield x
        else:
            yield item.lower()


# Класс для текста без "украшательств"
class Message(object):
    def __init__(self, text, **options):
        self.text = text
        self.options = options


#  Класс для текста в Markdown-формате
class Markdown(Message):
    def __init__(self, text, **options):
        super(Markup, self).__init__(text, parse_mode="Markdown", **options)


# Класс для текста в HTML-формате
class HTML(Message):
    def __init__(self, text, **options):
        super(HTML, self).__init__(text, parse_mode="HTML", **options)

'''
*********************************************************************
Блок функций работы с портфолио Клиента для удобства
- выводим только те категории, в которых есть активные продукты, еще не включенные в конкретное Портфолио
- выводим только те активные продукты конкретной категори, которые не включены в Портфолио
и т.д.
*********************************************************************
'''
def get_product_id_in_portfolio_list(user):
    return set(map(lambda x: x.product_id, Portfolio.objects.filter(is_active=True, user=user)))

def get_products_in_portfolio(user):
    return Product.objects.filter(is_active=True, id__in=get_product_id_in_portfolio_list(user))

def get_products_not_in_portfolio(user):
    return Product.objects.filter(is_active=True).exclude(id__in=get_product_id_in_portfolio_list(user))

def get_product_in_category_not_in_portfolio(user, category):
    return Product.objects.filter(is_active=True, category=category).exclude(id__in=get_product_id_in_portfolio_list(user))

def get_category_id_in_portfolio_list(user):
    return set(map(lambda x: x.product.category_id, Portfolio.objects.filter(is_active=True, user=user)))

def get_categories_in_portfolio(user):
    return ProductCategory.objects.filter(id__in=get_category_id_in_portfolio_list(user))

def get_categories_not_all_products_in_portfolio(user):
    id_list = set(map(lambda x: x.category_id, get_products_not_in_portfolio(user)))
    return ProductCategory.objects.filter(id__in=id_list)

# на будущее...
random_wrong_question = ['Перефразируйте пожалуйста. Не понимаю вопроса.:-)', \
                         'Не совсем понял вопроса. Можете задать по другому?', \
                         'Интересный вопрос. Уточните, пожалуйста, что Вы имеете ввиду', \
                         'Можете спросить по-другому?', \
                         'Задайте вопрос иначе. Не совсем понял, что Вы имеете ввиду.',
                         'А вот это интересно, но пока не понятно',
                         'Даже википедия ничего не знает! Можете спросить по-другому.',
                         'Надеюсь Вы не ругаетесь, потому что я ничего не понял.']
