# Implementação de Padrão Page Object para mais escalabilidade, mais fácil manutenção.
# Padrão de encapsulamento, agrupamento de keywords. (Criar um step de funcionalidade com vários argumentos com conceitos de programação)

*** Variables ***
${URL_NOTA_SIMPLES}           https://appbeta.notasimples.com.br/#!/login
${CAMPO_NOME}                 id:produto_nome
${CADASTRO_CNPJ_FORMATADO}    (91.595.111/0001-43)
${TIMEOUT}                    30
${SLEEP}                      20
${COD_Empresa_SAQUA}          36182
${Empresa_RazSocial_SAQUA}    Saquarema Ltda
${Id_Token_Vencido}           eyJraWQiOiJMelMyRldFRUFNV1NyNWVCY1RIYThCQ3JVcXVNeE1YdHRxRTJ6alFsWm9JPSIsImFsZyI6IlJTMjU2In0.eyJjdXN0b206bmZlbWFpbGFwcGlkIjoiU0FMVkFOT1RBIiwic3ViIjoiZTM0NzhlMzItMTRiOC00Mjg4LWFjYzAtNDJlZjFhOGU2ODdlIiwiY3VzdG9tOm5mZW1haWx1c2VybmFtZSI6IkxFT05BUkRPIENBVkFMQ0FOVEkiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImN1c3RvbTpuZmVtYWlsZW1wcmVzYWNucGoiOiIwODg4Nzk3NzAwMDIyMiIsImN1c3RvbTpuZmVtYWlsdXNlcmlkYWRtaW4iOiJUcnVlIiwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLnNhLWVhc3QtMS5hbWF6b25hd3MuY29tXC9zYS1lYXN0LTFfM3ZYaWNYOHVIIiwiY29nbml0bzp1c2VybmFtZSI6ImUzNDc4ZTMyLTE0YjgtNDI4OC1hY2MwLTQyZWYxYThlNjg3ZSIsImN1c3RvbTpuZmVtYWlsdXNlcmlkIjoiLTE3ODgwIiwiYXVkIjoic2dsNzhhcm90M2h1NGIzNGtnaWJqZjBxaCIsImN1c3RvbTpuZmVtYWlsdG9rZW4iOiJDZkRKOERFd3h3VEVxQ3hQaGFRYkY0QlFjZ3lHOFcxY2p6QjRwVjk3ekI4ZG4wWEhmWUN6TGRIYUhQSjFyNmtSQTJoeV9XOVdNaHVzTXlaUlhWdWlCejA2M0I0X3ZGYzEzdzF5UmozbnZMUzNURUdwWllaNUZsbHlWSmVyTVJlNnlPV1BGZyIsImN1c3RvbTpuZmVtYWlsZW1wcmVzYXJhemFvIjoiRU1QUkVTQSBURVNURSBMVERBIiwiZXZlbnRfaWQiOiJlNWMwOTkwMi1hZmRjLTQ0NTYtODE5MS01YzRiYmM5NmEwMTQiLCJ0b2tlbl91c2UiOiJpZCIsImF1dGhfdGltZSI6MTYyNzQ4MDgxNCwiY3VzdG9tOm5mZW1haWxlbXByZXNhbm9tZSI6IiFFbXByZXNhIFRlc3RlIiwiY3VzdG9tOm5mZW1haWxlbXByZXNhaWQiOiIxIiwiZXhwIjoxNjI3NDg2MjAzLCJpYXQiOjE2Mjc0ODI2MDMsImVtYWlsIjoiTEVPQEdSQVZFLk9SRyJ9.SXE4v6j3eEvPRkZbFraM2uHC2cpTVZrm5lTLHVjHOIai_CEq04RjOkgeXjIf-LD9uM9N0ZRM5Fz1vivn_ip6RBEDHojlpqK7RY1VZViCYsZNjor4y54gDkThxhx84EtvLjN4dkmnZtjSmXHChZQSPj91K7J2a67xjQrLzwlBvyHPoqijj7qVmSs0SyAPsNsu7vYiTFmFmeNIuaRKhP5pjacGT1NByafhosLA4N8Rav8z6SlaImbvxJZmzDNcrYWYmP-VUYBu7J0-5jtTnrIfSR6YnTzz6gJD3787wSgDFIyvFN6xWV9m6UPN9NsZAVHeju5GyHqWKffysMo6CveF0w

${PREFS_OP}                   add_argument("window-size=1920,1080");add_experimental_option("prefs", {'safebrowsing.enabled': 'false'});add_argument('log-level=3');add_argument("--disable-gpu");add_experimental_option("excludeSwitches", ['enable-logging'])    #;add_argument("--headless")

${CHAVE_NFE}                  33210291595111000143550010000000051199642685
${NUMERO_NFE}                 5
${CHAVE_NFE_2}                33200468639251000154550010000294711565130774
${NUMERO_NFE_2}               29471


*** Keywords ***

#___________________#
# Setup e teardown
#___________________#
Abrir navegador ${URL}
    Open Browser    ${URL}                  ${BROWSER}    timeout=${TIMEOUT}
    ...             options= ${PREFS_OP}

## Inicializando variáveis
Inicializar variáveis autenticação

  #_______________________UTIL__________________________#
    ${now}                                      Evaluate                   '{dt.day}/{dt.month}/{dt.year}'.format(dt=datetime.datetime.now())    modules=datetime
    set Global Variable                         ${DATA}                    ${now}
    Set Global Variable                         ${USUARIO_VALIDO_EMAIL}    testepainelv2@nfemail.com.br
    Set Global Variable                         ${USUARIO_VALIDO_SENHA}    123456789
    SeleniumLibrary.Set Screenshot Directory    ../Screenshots/

  #______________________SALVA NOTA_____________________#
    Set Suite Variable     ${USUARIO_VALIDO_NOME}          Robot Framework SA Teste
    Set Global Variable    ${SLEEP}                        5
    Set Global Variable    ${USUARIO_SALVANOTA}            testesalvanota@nfemail.com.br
    Set Global Variable    ${USUARIO_SALVANOTA2_EMAIL}     salvanota2@testenfemail.com.br
    Set Global Variable    ${USUARIO_SALVANOTA2_SENHA}     123456789
    Set Global Variable    ${USUARIO_SALVANOTA2_SENHA2}    987654321
    Set Global Variable    ${PASS_INVALIDO}                DF54Edr

  #______________________PAINEL_V2______________________#
    Set Suite Variable    ${ENTIDADE_TESTE}     TESTE
    Set Suite Variable    ${ENTIDADE_CODIGO}    12345
    Set Suite Variable    ${TEXTO_SIMPLES}      Teste on/off

Inicializar variáveis cadastro inicial
    Set Suite variable    ${TELNS}                       (21) 2121-2121
    Set Suite variable    ${CADASTRO_DDD}                       21
    Set Suite variable    ${CADASTRO_TELEFONE}                  22673372
    Set Suite variable    ${CADASTRO_RAMAL}                     01
    Set Suite variable    ${CADASTRO_DDD2}                      21
    Set Suite variable    ${CADASTRO_CELULAR}                   999990000
    Set Suite variable    ${CADASTRO_IDRADIO}                   radio01
    Set Suite variable    ${CADASTRO_CNPJ}                      91595111000143
    # Set Suite variable    ${CADASTRO_CNPJ_FORMATADO}            (91.595.111/0001-43)
    Set Suite variable    ${USUARIO_VALIDO_EMAILALTERNATIVO}    xlm@gmail.com

Inicializar variáveis CRUD de empresas 1
    Set Suite variable    ${CADASTRO_CNPJ1}           00.977.693/0001-77
    Set Suite variable    ${CADASTRO_RazSocial}       EMPRESA TESTE LTDA
    Set Suite variable    ${CADASTRO_NomeFantasia}    Nome da Empresa Teste
    Set Suite variable    ${CADASTRO_Estado}          RJ
    Set Suite variable    ${CADASTRO_DDD2}            21
    Set Suite variable    ${CADASTRO_CELULAR}         999990000
    Set Suite variable    ${CADASTRO_IDRADIO}         radio01

Inicializar variáveis CRUD de empresas 2
    Set Suite variable    ${CADASTRO_CNPJ2}                  91595111000143
    Set Suite variable    ${CADASTRO_RAZAO SOCIAL}           Lider Ltda
    Set Suite variable    ${CADASTRO_NOME FANTASIA}          Lider
    Set Suite variable    ${CADASTRO_ESTADO}                 RJ
  #Variaveis da empresa filha
    Set Suite variable    ${EMPRESA_EDIT_CNPJ}               08691613000124
    Set Suite variable    ${EMPRESA_EDIT_NOME FANTASIA}      Saqua
    Set Suite variable    ${EMPRESA_EDIT_RAZAO SOCIAL}       Saquarema Ltda
    set Suite variable    ${EMPRESA_EDIT_NOME_FANTASIA_2}    saqua123
    set Suite variable    ${EMPRESA_EDIT_RAZAO_SOCIAL_2}     Saquarema EIRELI



#____________Observações____________#
*** Comment ***
1) https://bugs.chromium.org/p/chromedriver/issues/list    Algumas falhas do chromedriver foram reportadas, 

pois em modo headless não tem executado os downloads de arquivos ou intercepta determinado click.
Temporariamente adicionando options específicas, a execução do teste é acertada.


2) Open Browser    Options

Set Selenium Implicit Wait    60

    ...    options=add_experimental_option("excludeSwitches", ['enable-logging'])    # Tirar aquelas msg warning do chrome no terminal, + organizado. Remover log do DevTools Chrome
    ...    options=add_argument("window-size=1920,1080")                             # Definindo tamanho da janela. Para não dar error alguns testes de: ElementNotInteractableException: Message: element not interactable / Failed: element not interactable in headless chrome

    add_argument("--no-sandbox");add_argument("--kiosk")
    add_argument("--start-maximized")
    add_argument("--headless")                                                  # Runs Chrome in headless mode.
    add_argument("--no-sandbox")                                                # Bypass OS security model
    add_argument("--disable-gpu")                                               # applicable to windows os only
    add_argument("--disable-extensions")
    add_argument("--disable-web-security")                                      #Não aplicar política de segurança,#Tirar a mensagem ao baixar um arquivo que pode danificar o computador
    add_argument("--safebrowsing-disable-download-protection")
    add_argument("--safebrowsing-disable-extension-blacklist")
    add_experimental_option("excludeSwitches",["ignore-certificate-errors"])
    add_argument("--ignore-certificate-errors")                                 #Para sites em HTTPS, evitando alertas de certificados
    add_argument("--incognito")                                                 #Abrir em Aba Anônima
    add_argument("--disable-popup-blocking")                                    #Bloquear Pop-ups
    add_argument("--disable-notifications")                                     #Bloquear Notificações
    add_argument("--headless")                                                  #Execução sem tela (para execução em containers)

    Maximize Browser Window

#_____________________#