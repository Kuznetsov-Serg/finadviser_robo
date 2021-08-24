
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from .models import ProductCategory, Product


def get_absolute_url(self):
    return reverse('products', kwargs={'category_id': self.category_id})


def products(request, pk=None, page=1):
    # pk - вх. параметр для страницы products (фильтр для показа related products) если=None - пункт "ВСЕ"
    title = 'фин.продукты'
    links_menu = ProductCategory.objects.all()      # Считаем все категории из справочника ("все" сформируем в HTML)

    if pk is not None:
        if pk == 0:
            category = {'name': 'все', 'pk': pk}
            products = Product.objects.all().order_by('name')
        else:
            category = get_object_or_404(ProductCategory, pk=pk)
            products = Product.objects.all().filter(category__pk=pk).order_by('name')
    else:
        pk = 0
        category = ''
        products = ''

    paginator = Paginator(products, 3)
    try:
        products_paginator = paginator.page(page)
    except PageNotAnInteger:
        products_paginator = paginator.page(1)
    except EmptyPage:
        products_paginator = paginator.page(paginator.num_pages)

    context = {
        'title': title,
        'links_menu': links_menu,
        'category': category,
        'category_id': pk,
        'hot_product': hot_product,
        'related_products': same_products,
        'products': products_paginator,
        # 'basket': basket,
    }
    return render(request, 'mainapp/products.html', context)


def product(request, pk=None):
    title = 'продукт'
    links_menu = ProductCategory.objects.all()      # Считаем все категории из справочника ("все" сформируем в HTML)
    # basket = get_basket(request.user)

    product = get_object_or_404(Product, pk=pk)
    same_products = get_same_products(product)

    context = {
        'title': title,
        'links_menu': links_menu,
        'related_products': same_products,
        'product': product,
        # 'basket': basket,
    }
    return render(request, 'mainapp/product.html', context)
