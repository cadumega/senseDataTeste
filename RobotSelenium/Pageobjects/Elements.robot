# Implementação de Padrão Page Object para mais escalabilidade, mais fácil manutenção.
# Padrão de encapsulamento, agrupamento de keywords. (Criar um step de funcionalidade com vários argumentos com conceitos de programação)

*** Variables ***
${USUARIO_SAUCE}    standard_user
${PASSWORD}         secret_sauce

${URL}        https://www.saucedemo.com/
${BROWSER}    chrome
${TIMEOUT}    30
${SLEEP}                 2

${PREFS_OP}    add_argument("window-size=1920,1080");add_experimental_option("prefs", {'safebrowsing.enabled': 'false'});add_argument('log-level=3');add_argument("--disable-gpu");add_experimental_option("excludeSwitches", ['enable-logging'])    #;add_argument("--headless")


*** Keywords ***
#___________________#
# Setup e teardown
#___________________#
Abrir navegador ${URL}
    Open Browser    ${URL}    ${BROWSER}    timeout=${TIMEOUT}
    ...             options= ${PREFS_OP}

Fechar Navegador
    Close Browser  

## Inicializando variáveis
Inicializar variáveis autenticação
  #_______________________UTIL__________________________#
    Set Global Variable                         ${USERNAME}        standard_user
    Set Global Variable                         ${PASSWORD}        secret_sauce
    SeleniumLibrary.Set Screenshot Directory    ../Screenshots/

  #______________________Preenchimentos_____________________#
    Set Suite Variable     ${FIRSTNAME}     Carlos
    Set Global Variable    ${LASTNAME}      Teste
    Set Global Variable    ${POSTALCODE}    12345