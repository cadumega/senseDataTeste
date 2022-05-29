*** Settings ***
Library      SeleniumLibrary
# Library    OperatingSystem
# Library    RequestsLibrary
# Library    Collections

Resource    Elements.robot

*** Variables ***
# Verificar arquivo Elements.robot

*** Keywords ***
#_______________________________________________________________#
# Aprimorar a manutenção e interpretação na leitura dos scripts de testes.
# Técnica keyword driven - Como steps explicado do caso de teste.
#_______________________________________________________________#

Aguardar
    Sleep    ${SLEEP}

Dado que acesso o site Saucedemo
    wait Until Element Is Visible    id=user-name
    wait Until Element Is Visible    id=password
    Input Text                       id=user-name       ${USUARIO_SAUCE}
    Input Text                       id=password        ${PASSWORD}
    Click Element                    id=login-button

E verifico se url contém "${ACTION}"
    Wait Until Location Contains    ${ACTION}    timeout=${TIMEOUT}

Então aparece a mensagem de título "${MENSAGEM}"
    Wait Until Element Is Visible    class=title
    Element Should Contain           class=title    ${MENSAGEM}    timeout=${TIMEOUT}
    Aguardar


Dado que irei colocar em ordem de preço low to high
    Click Element                class=product_sort_container
    Select From List By Index    class=product_sort_container    2

E que seleciono dois produtos específicos
    Click Element    id=add-to-cart-sauce-labs-onesie                    
    Click Element    id=add-to-cart-test.allthethings()-t-shirt-(red)

Extra adicionar um produto para testar remover na tela Your Cart
    Click Element    id=add-to-cart-sauce-labs-backpack

Então aparece o texto remove nos botões desses produtos selecionados
    Wait Until Element Is Visible    id=remove-sauce-labs-onesie                    
    Wait Until Element Is Visible    id=remove-test.allthethings()-t-shirt-(red)


Dado que clico no botão de carrinho de compras
    Click Element    class=shopping_cart_link

Extra remover produto backpack incorreto da minha seleção na tela Your Cart
    Click Element    id=remove-sauce-labs-backpack

Conferir os dois produtos selecionados
    Wait Until Element is Visible    id= item_2_title_link
    Wait Until Element is Visible    id= item_3_title_link

Extra testar se botão continue shopping retorna para tela de Products
    Wait Until Element is Visible    id=continue-shopping
    Click Element                    id=continue-shopping

Extra retornar a tela do carrinho e clicar no botão Checkout
    Dado que clico no botão de carrinho de compras
    Aguardar
    Wait Until Element is Visible                     id=checkout
    Click Element                                     id=checkout

Extra forçar em preencher só o First Name e aparecer Error
    Input Text                       id=first-name         ${FIRSTNAME}
    Click Element                    id=continue
    Aguardar
    Wait Until Element Is Visible    class=error-button

Dado que preencha os campos corretamente do formulário
    Input Text       id=first-name     ${FIRSTNAME}
    Input Text       id=last-name      ${LASTNAME}
    Input Text       id=postal-code    ${POSTALCODE}
    Click Element    id=continue

Extra Conferir se aparece os campos de Payment , Shipping e total
    Wait Until Element Is Visible    class=summary_info_label
    Wait Until Element Is Visible    class=summary_info_label
    Wait Until Element Is Visible    class=summary_total_label

Então finalizo a compra
    Click Element    id=finish

Dado que retorne a tela Inicializando
    Wait Until Element Is Visible    id=back-to-products
    Click Element                    id=back-to-products

Dado que clique no botão de Menu Burguer e faço o logout do site pela side bar
    Click Element    id=react-burger-menu-btn
    Aguardar
    Click Element    id=logout_sidebar_link

Então aparece a logo do site
    Wait Until Element Is Visible    class=login_logo