*** Settings ***
Documentation    Teste de Login e Finalização de Compra

Resource    ../Pageobjects/Elements.robot
Resource    ../Pageobjects/ResourceWeb.robot

Suite Setup        Run keywords
...                Inicializar variáveis autenticação
...                Abrir navegador ${URL}
Test Teardown    Fechar navegador

*** Variables ***

*** Keywords ***
# verificar arquivo ResourceWeb.robot

*** Test Case ***
#__________________________________________________________________#
# Esse caso de teste estou realizando login e uma finalização de compra
#__________________________________________________________________#
Caso de teste: Login e finalização de compra
    # [Tags]      Intro

    #1 desafio
    Dado que acesso o site Saucedemo
    E verifico se url contém "/inventory"
    Então aparece a mensagem de título "PRODUCTS"

    #2 e 3 desafio
    Dado que irei colocar em ordem de preço low to high
    E que seleciono dois produtos específicos
    Extra adicionar um produto para testar remover na tela Your Cart
    Então aparece o texto remove nos botões desses produtos selecionados

    #4 desafio
    Dado que clico no botão de carrinho de compras
    Então aparece a mensagem de título "YOUR CART"
    E verifico se url contém "/cart"
    Extra remover produto backpack incorreto da minha seleção na tela Your Cart
    Conferir os dois produtos selecionados

    Extra testar se botão continue shopping retorna para tela de Products
    Extra retornar a tela do carrinho e clicar no botão Checkout

    Então aparece a mensagem de título "CHECKOUT: YOUR INFORMATION"
    E verifico se url contém "/checkout-step-one"
    Extra forçar em preencher só o First Name e aparecer Error
    Dado que preencha os campos corretamente do formulário

    Então aparece a mensagem de título "CHECKOUT: OVERVIEW"
    E verifico se url contém "/checkout-step-two"
    Conferir os dois produtos selecionados
    Extra Conferir se aparece os campos de Payment , Shipping e total
    Então finalizo a compra

    Então aparece a mensagem de título "CHECKOUT: COMPLETE!"
    E verifico se url contém "/checkout-complete"
    Dado que retorne a tela Inicializando
    Então aparece a mensagem de título "PRODUCTS"
    Aguardar

    Dado que clique no botão de Menu Burguer e faço o logout do site pela side bar
    Aguardar
    Então aparece a logo do site










    # E verifico se url contém "dashboards/painel"
    # Então aparece a mensagem "Bem-vindo ao sistema SalvaNota"
    # Aguardar
    # Então a página deve conter o texto "Análise de arquivos armazenados"


# #Usuário não possui permissão ao sistema Salva Nota
#    Quando limpo o campo de texto "email"
#    Quando limpo o campo de texto "senha"
#    Dado que autentico com login "${USUARIO_VALIDO_EMAIL}" e senha "${USUARIO_SALVANOTA2_SENHA}"    #usando e-mail do painel
#    Então devo ver a mensagem de alerta "Acesso ao sistema Salva Nota negado."                      #Dado que clico no botão por classe "ajs-button ajs-ok"    #Verificar alerta "Acesso ao sistema Salva Nota negado."
