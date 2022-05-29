*** Settings ***
Documentation      Teste de Login e Finalização de Compra

Resource           ../Pageobjects/Elements.robot
Resource           ../Pageobjects/ResourceWeb.robot

Suite Setup        Run keywords
...                Inicializar variáveis autenticação
...                Abrir navegador ${URL}
Test Teardown      Fechar navegador

*** Variables ***

*** Test Case ***
#__________________________________________________________________#
# Esse caso de teste....
#__________________________________________________________________#
Caso de teste: Login e finalização de compra
   [Tags]      Incompleto
    Aguardar
    # Dado que acesso o site Saucedemo






    # E verifico se url contém "dashboards/painel"
    # Então aparece a mensagem "Bem-vindo ao sistema SalvaNota"
    # Aguardar
    # Então a página deve conter o texto "Análise de arquivos armazenados"


# #Usuário não possui permissão ao sistema Salva Nota
#    Quando limpo o campo de texto "email"
#    Quando limpo o campo de texto "senha"
#    Dado que autentico com login "${USUARIO_VALIDO_EMAIL}" e senha "${USUARIO_SALVANOTA2_SENHA}"    #usando e-mail do painel
#    Então devo ver a mensagem de alerta "Acesso ao sistema Salva Nota negado."                      #Dado que clico no botão por classe "ajs-button ajs-ok"    #Verificar alerta "Acesso ao sistema Salva Nota negado."
