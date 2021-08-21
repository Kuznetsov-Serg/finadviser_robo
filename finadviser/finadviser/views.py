from django.shortcuts import render

# Create your views here.

def index(request):
    title = 'Финансовый советник'
    context = {
        'title': title,
    }
    return render(request, 'finadviser/index.html', context)

def contacts(request):
    title = 'контакты'
    context = {
        'title': title,
        # 'basket': get_basket(request.user),
    }
    return render(request, 'finadviser/contact.html', context)
