*** Settings ***
Library     SeleniumLibrary
Library     String
Library     DateTime
Library     OperatingSystem
Library     RequestsLibrary
Library     Collections
Resource    Ambiente copy.robot
Resource    Elements.robot


*** Variables ***
## Acessar arquivo Elements.robot

*** Keywords ***
#_______________________________________________________________________________________#
# Aprimorar a manutenção e interpretação na leitura dos scripts de testes.
# Técnica keyword driven - Como steps explicado do caso de teste.
# Cobrindo os testes do Salva Nota com essa modalidade.
#________________________________________________________________________________________#
# Práticas de Desing Patterns e Clean code. Refatorando o ResourceWeb - Atualização Geral Outubro 2021
#________________________________________________________________________________________#

Autenticar com a conta Teste, o login e senha no Painel
    wait Until Element Is Visible    name=email
    wait Until Element Is Visible    name=senha
    Input Text                       xpath=//*[@name="email"]    ${USUARIO_VALIDO_EMAIL}
    Input Text                       xpath=//*[@name="senha"]    ${USUARIO_VALIDO_SENHA}
    Click Element                    name=entrar
    Aguardar

Autenticar com a conta Teste, o login e senha no NotaSimples
    wait Until Element Is Visible    name=email
    wait Until Element Is Visible    name=password
    Input Text                       xpath=//*[@name="email"]    ${USUARIO_SALVANOTA}
    Input Text                       xpath=//*[@name="password"]    ${USUARIO_VALIDO_SENHA}
    Click Element                    name=btn_entrar

##Autenticar com a conta Teste, o login e senha do SalvaNota
Dado que acesso o portal de cadastro do Salva Nota
    wait Until Element Is Visible    name=email
    wait Until Element Is Visible    name=senha
    Input Text                       xpath=//*[@name="email"]    ${USUARIO_SALVANOTA}
    Input Text                       xpath=//*[@name="senha"]    ${USUARIO_VALIDO_SENHA}
    Click Element                    name=btnLogar

##Acessar pelo painel, posso comentar a subkey acima e implementar essa abaixo também.
Dado que acesso o Salva Nota via PainelV2
    Dado que acesso url "https://testepainelv2.nfemail.com.br/"
    Autenticar com a conta Teste, o login e senha no Painel
    E verifico se url no painel contém "painel/atendimento/"

    Quando preencho "codigo" com ${COD_Empresa_SAQUA}
    Aguardar
    Dado que clico no botão por propriedade ng-click "pesquisarEmpresa()"
    Então a página deve conter o texto "${COD_Empresa_SAQUA}.${Empresa_RazSocial_SAQUA}"
    Dado que clico no botão por propriedade ng-click "carregarTabItens(3)"
    Aguardar

    Quando clico na opção de listagem por usuário ativo adicional "btn_acessarSalvaNota"
    Dado que troco para uma nova Guia no navegador
    Dado que clico em alterar empresa corrente
    E clico em selecionar empresa por nome "Robot Empresa"
    Aguardar

#obs. Retornar ao acesso externo , descomentar toaster msg e alterar url para salva nota na var. Abrir browser.

Quando clico na opção de listagem por usuário ativo adicional "${ID}"
     Click Element         xpath=(//button[@id="btn_acessarSalvaNota"])[2]
     Aguardar
#    Execute JavaScript    $("#${ID}").click()                                # seleção por tabela , mesma id 

Dado que troco para uma nova Guia no navegador
    Switch Window    NEW
    Aguardar

Fechar navegador
    Close browser

E verifico se url contém "${ACTION}"
    Wait Until Location Contains    ${ACTION}    timeout=${TIMEOUT}

E verifico se url no painel contém "${ACTION}"
    Wait Until Location Contains    ${ACTION}    timeout=${TIMEOUT}
    Aguardar

Dado que acesso url "${URL}"
    Go To       ${URL}
    Aguardar


Validar data de hoje com a "${KEY}"
    ${CurrentDate}    Get Current Date    result_format=%d-%m-%Y

#________________________#
# Acessar salvanota
#________________________#
Dado que autentico com login "${EMAIL}" e senha "${SENHA}"
    wait Until Element Is Visible    xpath=//*[@name="email"]
    wait Until Element Is Visible    xpath=//*[@name="senha"]
    Input Text                       xpath=//*[@name="email"]       ${EMAIL}
    Input Text                       xpath=//*[@name="senha"]       ${SENHA}
    Click Element                    xpath=//*[@name="btnLogar"]
    Aguardar

#_________________________#
# Acessar painelV2
#_________________________#
Autenticar login com "${EMAIL}" e senha "${SENHA}"
    wait Until Element Is Visible    xpath=//*[@name="email"]
    wait Until Element Is Visible    xpath=//*[@name="senha"]
    Input Text                       xpath=//*[@name="email"]     ${EMAIL}
    Input Text                       xpath=//*[@name="senha"]     ${SENHA}
    Click Element                    xpath=//*[@name="entrar"]

Aguardar
    Sleep    ${SLEEP}

Aguardar desbloqueio de tela
    Wait Until Element Is Not Visible    xpath=//*[@class="block-ui-overlay"]    timeout=${TIMEOUT}
    Wait Until Element Is Not Visible    xpath=//*[@class="block-ui-message"]    timeout=${TIMEOUT}
    Aguardar

Aguardar bloqueio tela
    Wait Until Element Is Visible    xpath=//*[@class="block-ui-overlay"]    timeout=${TIMEOUT}

Quando atualizo a página
    Reload Page
    Aguardar

Quando preencho formulário de cadastro
    Quando preencho "nome" com ${USUARIO_VALIDO_NOME}
    Quando preencho "senha" com ${USUARIO_VALIDO_SENHA}
    Quando preencho "telefone" com "${CADASTRO_DDD}" "${CADASTRO_TELEFONE}"
    Quando preencho "cnpj" com "${CADASTRO_CNPJ}"

Quando limpo o campo de texto "${ID}"
    Wait Until Element Is Visible    xpath=//*[@id="${ID}"]    
    Clear Element Text               xpath=//*[@id="${ID}"]

Então a página deve conter o texto "${TEXTO}"
    Page should contain    ${TEXTO}

Pagina não deve conter o texto "${TEXTO}"
    Page Should Not Contain    ${TEXTO}

Então aparece a mensagem de alerta "${MENSAGEM}"
    Alert Should be Present    ${MENSAGEM}
    Aguardar

Verificar alerta "${MENSAGEM}"
    Alert Should Be Present    ${MENSAGEM}                     action=ACCEPT    timeout=10s
    Click Element              xpath=//*[@class="${CLASS}"]

Confirmar alerta "${MENSAGEM}"
    Alert Should Be Present    ${MENSAGEM}    action=ACCEPT    timeout=10s

Confirmar que não aparece alerta "${MENSAGEM}"
    Alert Should Not Be Present    ${MENSAGEM}

Confirmar alerta por id "${id}"
    Click Element    id=${ID}

Então devo ver a mensagem de alerta "${MENSAGEM}"
    Wait Until Element Is Visible    xpath=//*[@class="ajs-button ajs-ok"]
    Click Element                    xpath=//*[@class="ajs-button ajs-ok"]
    Aguardar

Então aparece a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible    xpath=//*[@id="toast-container"]
    Element Should Contain           xpath=//*[@id="toast-container"]    ${MENSAGEM}    timeout=${TIMEOUT}
    Aguardar

Atributo por classe "${CLASS}" possui texto "${TEXTO}"
    Element Text Should Be    xpath=//*[@class="${CLASS}"]    ${TEXTO}


Quando preencho por ng-model "${NAME}" com ${VALOR}
    Wait Until Element Is Visible    xpath=//*[@ng-model="${NAME}"]
    Input Text                       xpath=//*[@ng-model="${NAME}"]    ${VALOR}

Quando preencho "${NAME}" com ${VALOR}
    Wait Until Element Is Visible    xpath=//*[@name="${NAME}"]
    Input Text                       xpath=//*[@name="${NAME}"]    ${VALOR}

Quando preencho id "${ID}" com ${VALOR}
    Wait Until Element Is Visible    xpath=//*[@id="${ID}"]
    Input Text                       xpath=//*[@id="${ID}"]    ${VALOR}

Quando preencho por classe "${CLASS}" com ${VALOR}
    Wait Until Element Is Visible    xpath=//*[@class="${NAME}"]
    Input Text                       xpath=//*[@class="${NAME}"]    ${VALOR}

Então o elemento "${ID}" está desabilitado
    Wait Until Element Is Visible    xpath=//*[@id="${ID}"]
    Element Should Be Disabled       ${ID}
    Aguardar

Então o elemento "${ID}" está habilitado
    Wait Until Element Is Visible    xpath=//*[@id="${ID}"]
    Element Should Be Enabled        ${ID}
    Aguardar

Então o elemento "${ID}" está visível
    Element Should Be Visible    ${ID}
    Aguardar

Então o elemento "${ID}" não está visível
    Element Should Not Be Visible    ${ID}
    Aguardar
Então o elemento de classe "${CLASS}" não está visível
    Element Should Not Be Visible    ${CLASS}
    Aguardar
Então o elemento de classe "${CLASS}" com a "${MENSAGEM}" não está visível
    Element Should Not Be Visible    ${CLASS}
    Aguardar

Então o elemento de classe "${CLASS}" com a "${MENSAGEM}" está visível
    Element Should Be Visible    ${CLASS}
    Aguardar
Então valido o elemento "${ID}" contem texto "${TEXTO}"
    Element Should Contain    ${ID}    ${TEXTO}    timeout=${TIMEOUT}
    Aguardar
Então o elemento "${ID}" não contém texto "${TEXTO}"
    Element Should Not Contain    ${ID}    ${TEXTO}    timeout=${TIMEOUT}
    Aguardar

Então o elemento "${ID}" possui texto "${TEXTO}"
    Element Text Should Be    xpath=//*[@name="${ID}"]    ${TEXTO}
    Aguardar
Então o elemento texto "${ID}" possui texto "${TEXTO}"
    Wait Until Element Is Visible    xpath=//*[@id="${ID}"]
    ${GET_TEXT}                      Get Element Attribute     xpath=//*[@name="${ID}"]    value
    Should Be Equal As Strings       ${GET_TEXT}               ${TEXTO}
    Aguardar
Então o elemento "${ID}" possui conteúdo "${TEXTO}"
    Wait Until Element Is Visible    xpath=//*[@id="${ID}"]
    ${GET_TEXT}                      Get Element Attribute     xpath=//*[@name="${ID}"]    innerHTML
    Should Be Equal As Strings       ${GET_TEXT}               ${TEXTO}
    Aguardar
#________________________________________________#
# Tratamento do span
#________________________________________________#
Então o elemento span "${SPAN_NAME}" possui texto "${TEXTO}"
    Element Text Should Be    xpath=//*[@ng-show="${SPAN_NAME}"]    ${TEXTO}

Então o elemento class "${CLASS_NAME}" possui texto "${TEXTO}"
    Element Text Should Be    xpath=//*[@class="${CLASS_NAME}"]    ${TEXTO}

Mensagem obrigatoria aparece name "${NAME}" e possui texto "${TEXTO}"
    Element Text Should Be    xpath=//*[@name="${NAME}"]    ${TEXTO}

Mensagem obrigatoria aparece id "${ID}" e possui texto "${TEXTO}"
    Element Text Should Be    xpath=//*[@id="${ID}"]    ${TEXTO}

#__________________________________________________________________#
# Tratamento de Select , alterações de lista/classificação
#__________________________________________________________________#
Quando preencho select "${ID}" com ${TEXTO}
    Wait Until Element Is Enabled    xpath=//*[@id="${ID}"]
    Set Focus To Element             xpath=//*[@id="${ID}"]
    Click Element                    xpath=//*[@id="${ID}"]
    Click Element                    xpath=//*[@id="${ID}"]/option[@label="${TEXTO}"]


Quando preencho box list "${ID}" com ${TEXTO}
    Wait Until Element Is Enabled    xpath=//*[@id="${ID}"]                            # nova, serviu no tp3, tp17, tp23, p/ listagens
    Set Focus To Element             xpath=//*[@id="${ID}"]
    Click Element                    xpath=//*[@id="${ID}"]
    Click Element                    xpath=//*[@id="${ID}"]/option[@label=${TEXTO}]

Quando preencho Status "${ID}" com ${label}
    Wait Until Element Is Enabled    xpath=//*[@id="${ID}"]                            # nova, serviu no tp3, tp17, tp23, p/ listagens
    Set Focus To Element             xpath=//*[@id="${ID}"]
    Click Element                    xpath=//*[@id="${ID}"]
    Aguardar
    Click Element                    xpath=//*[@id="${ID}"]/option[@label=${label}]
#Pesquisar código escrito em JS, para alguns testes

#______________________________#
# CHECKBOX
#______________________________#
Selecionar checkbox "${XPATH}"
    Select Checkbox    xpath=${XPATH}

Marcar checkBox name "${NAME}"
    Set Focus to Element    xpath=//*[@name="${NAME}"]
    Select Checkbox         xpath=//*[@name="${NAME}"] 

Desmarcar checkBox name "${NAME}"
    Set Focus To Element    xpath=//*[@name="${NAME}"] 
    Unselect Checkbox       xpath=//*[@name="${NAME}"]

Marcar checkBox ng-model ${NG-MODEL} que contenha value ${VALUE}
    Set Focus to Element    xpath=//*[@ng-model="${NG-MODEL}"][@value="${VALUE}"]
    Click Element           xpath=//*[@ng-model="${NG-MODEL}"][@value="${VALUE}"]

Marcar checkBox model "${MODEL}"
    Set Focus To Element    xpath=//*[@ng-model="${MODEL}"]
    Select Checkbox         xpath=//*[@ng-model="${MODEL}"]

Desmarcar checkBox model "${MODEL}"
    Set Focus To Element    xpath=//*[@ng-model="${MODEL}"]
    Unselect Checkbox       xpath=//*[@ng-model="${MODEL}"]

#_______________________________#
# Ações de clicar
#_______________________________#
Dado que clico no botão por propriedade name "${NAME}"
    Wait Until Element Is Visible    xpath=//*[@id="${NAME}"]     timeout=${TIMEOUT}
    Wait Until Element Is Enabled    xpath=//*[@id="${NAME}"]     timeout=${TIMEOUT}
    Set Focus To Element             xpath=//*[@id="${NAME}"] 
    Execute JavaScript               $("#${NAME}").click()

E clico em selecionar empresa por nome "${nome}"
    Wait Until Element is Visible    xpath=//*[@id="page-wrapper"]//tr[td[contains(text(),"${NOME}")]]/td[1]/button
    Click Element                    xpath=//*[@id="page-wrapper"]//tr[td[contains(text(),"${NOME}")]]/td[1]/button

Clicar no Então o elemento por ng-class "${NG_CLASS}"
    Wait Until Element is Visible    xpath=//*[@ng-class="${NG_CLASS}"]
    Click Element                    xpath=//*[@ng-class="${NG_CLASS}"]

Dado que clico no botão por propriedade ng-model "${NAME}"
    Wait Until Element is Visible    xpath=//*[@ng-model="${NAME}"]
    Wait Until Element Is Enabled    xpath=//*[@ng-model="${NAME}"]
    Set Focus To Element             xpath=//*[@ng-model="${NAME}"]
    Click Element                    xpath=//*[@ng-model="${NAME}"]
    Aguardar


Dado que clico no botão por propriedade ng-click "${NAME}"
    Wait Until Element is Visible    xpath=//*[@ng-click="${NAME}"]
    Wait Until Element Is Enabled    xpath=//*[@ng-click="${NAME}"]
    Set Focus To Element             xpath=//*[@ng-click="${NAME}"]
    Click Element                    xpath=//*[@ng-click="${NAME}"]
    Aguardar

Dado que clico no elemento de ng-click "${NAME}"
    Wait Until Element is Visible    xpath=//*[@ng-click="${NAME}"]
    Wait Until Element Is Enabled    xpath=//*[@ng-click="${NAME}"]
    Set Focus To Element             xpath=//*[@ng-click="${NAME}"]
    Click Element                    xpath=//*[@ng-click="${NAME}"]

Dado que clico no botão de alerta "${ID}"
    Wait Until Element is Visible    xpath=//*[@id="${ID}"]
    Wait Until Element Is Enabled    xpath=//*[@id="${ID}"]
    Set Focus To Element             xpath=//*[@id="${ID}"]
    Click Element                    xpath=//*[@id="${ID}"]

Dado que clico no botão por propriedade id "${ID}"
    Wait Until Element is Visible    xpath=//*[@id="${ID}"]
    Wait Until Element Is Enabled    xpath=//*[@id="${ID}"]
    Set Focus To Element             xpath=//*[@id="${ID}"]
    Click Element                    xpath=//*[@id="${ID}"]
    Aguardar

Dado que clico no campo por id "${ID}"
    Wait Until Element is Visible    xpath=//*[@id="${ID}"]
    Wait Until Element Is Enabled    xpath=//*[@id="${ID}"]
    Set Focus To Element             xpath=//*[@id="${ID}"]
    Click Element                    xpath=//*[@id="${ID}"]

Dado que clico no botão por classe "${CLASS}"
    Wait Until Element is Visible    xpath=//*[@class="${CLASS}"] 
    Set focus to element             xpath=//*[@class="${CLASS}"]
    Click Element                    xpath=//*[@class="${CLASS}"] 
    Aguardar

Clicar no botao por name "${NAME}"
    Wait Until Element is Visible    xpath=//*[@class="${NAME}"] 
    Set focus to element             xpath=//*[@class="${NAME}"]
    Click Element                    xpath=//*[@class="${NAME}"] 

Clicar no botao por id "${ID}"
    Wait Until Element is Visible    xpath=//*[@id="${ID}"] 
    Set focus to element             xpath=//*[@id="${ID}"]
    Click Element                    xpath=//*[@id="${ID}"] 

Clicar na opção dropdown "${FILTRO}"
    Click Element    xpath=//*[@ng-repeat="item in tiposConsulta"]/a[contains(text(),"${FILTRO}")]



Dado que clico no botão por elemento ui-sref "${NAME}"
    wait Until Element is Visible    xpath=//*[@ui-sref="${NAME}"]    timeout=${TIMEOUT}
    Set Focus To Element             xpath=//*[@ui-sref="${NAME}"]
    Click Element                    xpath=//*[@ui-sref="${NAME}"]
    Aguardar



Clicar no Então o elemento por classe "${CLASS}" onde contenha o texto "${TEXTO}"
    Set Focus to Element             xpath=//*[@class="${CLASS}"][contains(text(),"${TEXTO}")]
    wait Until Element is Visible    xpath=//*[@class="${CLASS}"][contains(text(),"${TEXTO}")]
    Click Element                    xpath=//*[@class="${CLASS}"][contains(text(),"${TEXTO}")]

Clicar botao ng-click "${NAME}" que contenha texto "${TEXTO}"
    Wait Until Element is Visible    xpath=//*[@ng-click="${NAME}"]/td[contains(text(),"${TEXTO}")]
    Set Focus To Element             xpath=//*[@ng-click="${NAME}"]/td[contains(text(),"${TEXTO}")]
    Click Element                    xpath=//*[@ng-click="${NAME}"]/td[contains(text(),"${TEXTO}")]

Clicar no botao "${NAME}" que contenha texto "${TEXTO}"
    Wait Until Element is Visible    xpath=//*[@ng-click="${NAME}"]/td[contains(text(),"${TEXTO}")]
    Set Focus To Element             xpath=//*[@ng-click="${NAME}"]/td[contains(text(),"${TEXTO}")]
    Click Element                    xpath=//*[@ng-click="${NAME}"]/td[contains(text(),"${TEXTO}")]

Clicar no botao "${NAME}" que possui o texto "${TEXTO}"
    Wait Until Element is Visible    xpath=//*[@name="${NAME}"]/td/span[contains(text(),"${TEXTO}")]
    Set Focus To Element             xpath=//*[@name="${NAME}"]/td/span[contains(text(),"${TEXTO}")]
    Click Element                    xpath=//*[@name="${NAME}"]/td/span[contains(text(),"${TEXTO}")]

Clicar na opção de filtro "${ID}" que possui o texto ${TEXTO}
    Wait Until Element is Visible    xpath=//*[@id="${ID}"][contains(text(),"${TEXTO}")]
    Wait Until Element Is Enabled    xpath=//*[@id="${ID}"][contains(text(),"${TEXTO}")]
    Set Focus To Element             xpath=//*[@id="${ID}"][contains(text(),"${TEXTO}")]
    Click Element                    xpath=//*[@id="${ID}"][contains(text(),"${TEXTO}")]

#___________________________________________________________________________#
# VALIDAÇÕES e Checkpoints - Habilitado ou Desabilitado / Ativo ou Inativo /
# Marcado ou não marcado / Selecionado ou não selecionado
#____________________________________________________________________________#
Então valido o elemento "${texto}" está desabilitado
    Element should be Disabled    xpath=//*[@id="${texto}"] 

Então valido o elemento "${texto}" se encontra desabilitado
    Element should be Disabled    xpath=//*[@name="${texto}"] 

Então valido o elemento "${texto}" está habilitado
    Element should be Enabled    xpath=//*[@id="${texto}"] 

Então valido o elemento "${texto}" se encontra habilitado
    Element should be Enabled    xpath=//*[@name="${texto}"] 


Então o elemento por id "${ID}" está habilitado
    Element should be Enabled    xpath=//*[@id="${id}"]

Então o elemento por id "${ID}" está desabilitado
    Element should be Disabled    xpath=//*[@id="${id}"]

Então o elemento por ng-click "${texto}" está habilitado
    Element should be Enabled    xpath=//*[@ng-click="${texto}"]

Então o elemento por ng-click "${texto}" está desabilitado
    Element should be Disabled    xpath=//*[@ng-click="${texto}"]

Então o elemento ng-click "${NAME}" que possui texto "${TEXTO}" está habilitado
    Wait Until Element is Visible    xpath=//*[@ng-click="${NAME}"][contains(text(),"${TEXTO}")]
    Element should be Enabled        xpath=//*[@ng-click="${NAME}"][contains(text(),"${TEXTO}")]

Então o elemento ng-click "${NAME}" que possui texto "${TEXTO}" está desabilitado
    Wait Until Element is Visible    xpath=//*[@ng-click="${NAME}"][contains(text(),"${TEXTO}")]
    Element Should Be Disabled       xpath=//*[@ng-click="${NAME}"][contains(text(),"${TEXTO}")]    

#___________________________________________#
# Outras Keywords com ações específicas
#___________________________________________#
Quando limpo o campo de texto
    wait until Element Is Enabled    xpath=//*[@id="justificativa_textarea"]    timeout=60s
    Click Element                    xpath=//*[@id="justificativa_textarea"]
    Clear Element Text               xpath=//*[@id="justificativa_textarea"]


Dado que mude o tamanho da janela para "${WIDITH}" x "${HEIGHT}"
    Set Window Size    ${WIDITH}    ${HEIGHT}
    Aguardar 

Dado que armazeno arquivo xml nome "${NAME}"
    Execute JavaScript    document.getElementById("ngf-label-armazenarArquivo").setAttribute("Style", visibility = "Visible")
    Execute JavaScript    document.getElementById("ngf-armazenarArquivo").setAttribute("tabindex","0")

    Wait Until Element is Visible    ${uploadFiletest}                5                                   seconds
    Wait Until Element Is Enabled    ${uploadFiletest}                5                                   seconds
    Set Focus To Element             ${uploadFiletest}
    ${check_element}=                Run Keyword and Return Status    Wait Until Page Contains Element    ${uploadFiletest}    5s
    Run Keyword If                   '${check_element}' == 'True'     Choose File                         ${uploadFiletest}    ${FILE_PATH}/${NAME}    
    Aguardar

Download File ${COOKIE} ${URL} ${FILENAME}
    ${COOKIE_VALUE} =    Call Selenium API                                                                                    get_cookie_by_name    ${COOKIE}
    Run and Return RC    wget --cookies=on --header "Cookie: ${COOKIE}=${COOKIE_VALUE}" -O ${CURDIR}${/}${FILENAME} ${URL}


Dado que altero a key "${KEY}" em sessionStorage para ${VALOR}
    Execute JavaScript    sessionStorage.setItem('${KEY}','${VALOR}')
    Aguardar

Então valido a key"${KEY}" em sessionStorage NÃO possui value ${VALOR}
    Execute JavaScript     sessionStorage.getItem('${KEY}');
    Should Not Be Equal    ${VALOR}                             false



Verificar resultado filtro ng-binding "${TEXTO}"
    Wait Until Element is Visible    xpath=//*[@class="ng-binding"][contains(text(),"${TEXTO}")]
    Page should Contain Element      xpath=//*[@class="ng-binding"][contains(text(),"${TEXTO}")]

Verificar filtro por classe ${CLASS} que contenha ${Então o elemento}
    Wait Until Element is Visible    xpath=//*[@class="${CLASS}"][contains(text(),"${Então o elemento}")]
    Page should Contain Element      xpath=//*[@class="${CLASS}"][contains(text(),"${Então o elemento}")]


Verificar se Então o elemento "${NOME}" esta selecionado no filtro
    Wait Until Element is Visible    xpath=    //*[@class="input-group-btn"]//button[contains(text(),${NOME})]


Então o elemento css "${CSS_ELEMENT}" no id ${ID} possui valor "${VALUE}"
    ${ELEMENT}                    Execute JavaScript    return document.defaultView.getComputedStyle(document.getElementById(${ID}),null).getPropertyValue('background-color');
    Should Be Equal As Strings    ${ELEMENT}            ${VALUE}


##############    Uso em TABELAS    TD ---> a

Clicar em editar no registro que contenha o Então o elemento ${Então o elemento}
    Wait Until Element is Visible    xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/td/a[1]
    Wait Until Element Is Enabled    xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/td/a[1]
    Click Element                    xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/td/a[1]

Clicar em editar no registro que contem Então o elemento ${Então o elemento}
    Wait Until Element is Visible    xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/span[1]
    Wait Until Element Is Enabled    xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/span[1]
    Click Element                    xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/span[1]


Clicar em reativar no registro que contenha o Então o elemento ${Então o elemento}
    Wait Until Element is Visible    xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/td/a[contains(text(),"Reativar")]
    Wait Until Element Is Enabled    xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/td/a[contains(text(),"Reativar")]
    Set Focus To Element             xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/td/a[contains(text(),"Reativar")]
    Click Element                    xpath=//*//tr[td[contains(text(),"${Então o elemento}")]]/td/a[contains(text(),"Reativar")]


Registro codigo ${CODIGO} possui status "${STATUS}"
    Wait Until Element Is Visible    xpath=//*//tr[td[contains(text(),"${CODIGO}")]]/td/span[contains(text(),"${STATUS}")]
    Element Should be visible        xpath=//*//tr[td[contains(text(),"${CODIGO}")]]/td/span[contains(text(),"${STATUS}")]


Botão se encontra habilitado
    Wait Until Element Is Visible    id=cadastrar    # key suite test e não global
    Element Should Be Enabled        id=cadastrar

Botão se encontra desabilitado
    Wait Until Element Is Visible    id=cadastrar    # key suite test e não global
    Element Should Be Disabled       id=cadastrar

#_________________#
# Ação de Clicar
#_________________#

Dado que clico no botão Cadastrar-se Agora
    Wait Until Element Is Visible    id=cadastrar_agora
    Click Element                    id=cadastrar_agora
    Aguardar

Dado que clico no botão Começar a utilizar gratuitamente
    Click Button    id=cadastrar_gratis
    Aguardar

E clico no botão Prosseguir
    Click Button    id=confirmarEmail
    Aguardar

E clico no campo Já possui um cadastro no SalvaNota
    Click Element    id=logar
    Aguardar


Clicar no botao de Menu
    Click Element    id=btn_hambur    #menu hamburguer

Dado que clico no botão de Menu Opções
    Click Element    xpath:(.//span[contains(., 'opções')])[last()]/child::b

E clico na opção Meus Dados
    Wait Until Element is Visible    xpath=//*[@id="meus_dados"]    timeout=60s
    Wait Until Element Is Enabled    xpath=//*[@id="meus_dados"]
    Set Focus To Element             xpath=//*[@id="meus_dados"]
    Click Element                    xpath=//*[@id="meus_dados"]
    Aguardar

E clico na opção Alterar Senha
    Wait Until Element is Visible    xpath=//*[@id="alterar_senha"]     timeout=60s
    Wait Until Element Is Enabled    xpath=//*[@id="alterar_senha"] 
    Set Focus To Element             xpath=//*[@id="alterar_senha"] 
    Click Element                    xpath=//*[@id="alterar_senha"] 

Então clico no botão de confirmar Alterar Senha
    Click Element    id=alterar
    Aguardar

Dado que clico na opção Esqueci minha senha
    Click Element    id=esqueci_pass
    Aguardar

Clicar no botão de Alterar senha
    Click Element id=lembrar_senha

E clico no botão Pesquisar
    Click Button    name=btn_pesquisar    #alterar name id
    Aguardar

Dado que clico no botão Salvar
    Click Element    id=btn_salvar

Clicar no botão Inativar
    Click Element    id=btn_inativar

Clicar no botão para Reativar Usuário
    Click Element    id=btn_ativar

E clico no botão Voltar
    Click Element    id=btn_voltar
    Aguardar

E clico no botão Sair
    Click Element    id=btn_sair
    Aguardar

E clico no botão Sair do topo
     Click Element       xpath=/html/body/div[2]/div/div[2]/div[1]/div/nav/ul/li[4]/a

E clico no botão fechar
    Click Element    id=btn_close

Dado que clico no botão Incluir
    Set focus to element    id=btn_incluir
    Click Button            xpath=//*[@id="btn_incluir"]

E clico no botão desfazer
    Click Button    name=btn_desfazer

Clicar no botão Encerrar conta
    Click Button    name=btn_encerrarConta

E clico no botão Manual da API
    Click Element    name=site_manualAPI

E clico na opção de Gerar Chave Api
    Click Element    name=gerarChaveApi

Dado que clico no botão filtrar
    Click Button    name=btn_filtrar
    Aguardar

Quando clico no botão limpar filtro
    Click Button    name=limparFiltro

Clicar no botão Exibir
    Click Button    name=btn_exibir

Clicar no botão Realizar Manifestação
    Click Button    name=btn_manifestacao

Clicar no botão Manifestar
    Click Button    name=btn_manifestar

E clico no botão Buscar
    Click Button    name=btn_buscar
    Aguardar

E clico no botão Atualizar
    Click Button    name=btn_atualizar
    Aguardar

Dado que clico no botão visualizar
    # Click Element         xpath=//tbody/tr[4]/td[7]/button[1]
    Click Element    xpath=//*[@id="btn_visualizar"] 
    Aguardar

Clicar no botão baixar XML
    ${prefs}    Create Dictionary    download.default_directory=C:\\Downloads    #Configurando um diretório para download ${prefs}    Create Dictionary    download.default_directory=C:\\Documentos    options=add_experimental_option('prefs', ${prefs})
    # ${CHROME_OPTIONS}=  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver

    Click Button    name=btn_xml

Clicar no botão exibir Danfe
    wait Until Element is Visible    xpath=//tbody/tr[1]/td[8]/button[1]/i[1]    timeout=${TIMEOUT}
    Set Focus To Element             xpath=//tbody/tr[1]/td[8]/button[1]/i[1]
    Click Element                    xpath=//tbody/tr[1]/td[8]/button[1]/i[1]

    # Click Element         xpath=//*[@id="btn_danfe"]


Então clico no botão selecionar todas as empresas
    Click Button    id=btn_todasEmpresas
    Aguardar

Clicar no botão OK do alerta
    Click Button    class=ajs-button ajs-ok

Digitar "${TEXTO}" no campo de pesquisa
    Input Text    id=search_query_top    ${TEXTO}

Verificar e clicar em OK para confirmar o alerta "${MENSAGEM} "
    Alert Should Be Present    ${MENSAGEM}                     action=ACCEPT    timeout=10s
    Click Element              xpath=//*[@class="${CLASS}"]

Digitar o CNPJ "${CNPJ_TESTE}" no campo de pesquisa
    Input Text    id=cnpjteste    ${CNPJ_TESTE}


#Testes em Dcumentos e Relatórios SVN 13-25
Clicar no campo de data
    Click Element    id=reportrange

Clicar no campo Customizar...
    Click Element    xpath=//li[normalize-space()='Customizar...']

Quando clico no botão Aplicar
    Click Element    id=Aplicar

E clico na opção de Cancelar
    Click Element    id=btn_cancelar

Dado que no critério de data, selecionar a opção Recepção
    Click Element    xpath=//input[@type="radio"][following-sibling::label[1][.="Recepção"]]    #Verificar documentação Robot para outros exemplos. Se fosse por id ou name conseguiria fazer da maneira,    Select Radio Button    tiposPeriodo    Recepção 

Dado que no critério data, selecionar a opção Emissão
    Click Element    xpath=//input[@type="radio"][following-sibling::label[1][.="Emissão"]]


No Tipo de Documento, escolher a opção ambos
    Click Element    xpath=//input[@type="radio"][following-sibling::label[1][.="ambos"]]

No Tipo de Documento, escolher a opção entradas
    Click Element    xpath=//input[@type="radio"][following-sibling::label[1][.="entradas"]]

No Tipo de Documento, escolher a opção saídas
    Click Element    xpath=//input[@type="radio"][following-sibling::label[1][.="saídas"]]

Clicar na listagem de Emitente e selecionar "${TEXTO}"
    Wait Until Element is Visible    id=emitenteSelecionado
    Click Element                    id=emitenteSelecionado
    Aguardar
    # Click Element                  xpath=//*[@class="ng-binding ng-scope"]/option[@label="${TEXTO}"]
    Click Element                    xpath=//*[@class="ng-binding ng-scope"][contains(text(),"${TEXTO}")]


Clicar na listagem de Destinatário e selecionar "${TEXTO2}"
    Wait Until Element is Visible    id=destinatarioSelecionado
    Click Element                    id=destinatarioSelecionado
    Aguardar
    Click Element                    xpath=//*[@class="ng-binding ng-scope"][contains(text(),"${TEXTO2}")]

#________________________#
# Mensagens obrigatórias *
#________________________#
Então valido mensagem obrigatória de e-mail
    Element Should Be Visible    id=email_obrigatorio

Então valido mensagem de confirmação e-mail obrigatório
    Element Should Be Visible    id=emailconfirmacao_obrigatorio

Então valido mensagem obrigatória de nome
    Element Should Be Visible    id=msg_obgNome

Então valido mensagem obrigatória de senha
    Element Should Be Visible    id=msg_obgsenha

Então valido mensagem obrigatória de telefone
    Element Should Be Visible    id=msg_obgTel

Então valido mensagem obrigatória de DDD
    Element Should Be Visible    id=ddd_obg

Então valido mensagem obrigatória de CNPJ
    Element Should Be Visible    id=msg_obgCNPJ

Então valido mensagem obrigatória de pelo menos uma empresa selecionada
    Element Should Be Visible    id=msg_obgEmpresa

E valido não aparecer mensagem obrigatória de pelo menos uma empresa selecionada
    Element Should Not Be Visible    id=msg_obgEmpresa

Então valido mensagem obrigatória de Justificativa
    Element Should Be Visible    id=msg_obgJustificativa

Validar mensagem obrigatória Tipo de Manifestação
    Element Should Be Visible    id=msg_obgManifesta

Validar mensagem obrigatória Razao Social
    Element Should Be Visible    id=msg_obgRazSocial

Validar mensagem obrigatória Nome Fantasia
    Element Should Be Visible    id=msg_obgFantasia

Validar mensagem obrigatória UF
    Element Should Be Visible    id=msg_obgUF

Validar mensagem de pelo menos selecione uma empresa
    Element Should Be Visible    id=msg_obgEmpresa

Validar mensagem de error e-mail de cobrança inválido
    Element Should Be Visible    id=msg_mailCobInvalido

Validar mensagem de error e-mail inválido
    Element Should Be Visible    id=msg_mailInvalido


Conferir o texto alterado e salvo se apresenta ${TEXTO}
    Element Should Be Visible    id=nome_empresa

Dado que clico no Menu Usuários
    Click Element    id=menu_usuarios
    Aguardar         

Dado que clico em alterar empresa corrente
    Click Element    id=cnpj_Corrente
    Aguardar

Dado que aguarde 1 minuto
    Sleep    1 minute

#SVN0
Dado que limpe os campos de cadastro
    Clear Element Text    id=email
    Clear Element Text    id=nome
    Clear Element Text    id=senha

Preencher campos hipotéticos de cadastro
    Quando preencho "email" com teste@robotteste.com
    Quando preencho "nome" com ${USUARIO_VALIDO_NOME}
    Quando preencho "senha" com ${USUARIO_VALIDO_SENHA}
    Quando preencho "telefone" com ${CADASTRO_DDD} ${CADASTRO_TELEFONE}
    Quando preencho "cnpj" com 000000000000
    Aguardar
    Quando preencho "email" com teste@robotteste.com
    Quando preencho "nome" com ${USUARIO_VALIDO_NOME}
    Quando preencho "senha" com ${USUARIO_VALIDO_SENHA}
    Quando preencho "telefone" com ${CADASTRO_DDD} ${CADASTRO_TELEFONE}
    Quando preencho "cnpj" com 000000000000
    Aguardar

#SVN22
Quando clico para limpar campos de alteração dos dados
    Clear Element Text    id=nome
    Clear Element Text    id=ddd
    Clear Element Text    id=telefone

    Clear Element Text    id=ddd2
    Clear Element Text    id=celular
    Clear Element Text    id=ramal
    Clear Element Text    id=idRadio
    Clear Element Text    id=email2

Quando preencho os dados obrigatórios
    Input Text    id=nome        Robot Framework SA Teste
    Input Text    id=ddd         21
    Input Text    id=telefone    2323-2323

Quando preencho outros dados
    Input Text    id=ddd2       11
    Input Text    id=celular    99999-9999
    Input Text    id=ramal      90
    Input Text    id=idRadio    111

    Input Text    id=email2    emailalternativotesterobot@nfemail.com.br

Validar dados salvos
    Page should contain    Robot Framework SA Teste    21
    Page should contain    2323-2323                   11 
    Page should contain    99999-9999                  90
    Page should contain    111                         emailalternativotesterobot@nfemail.com.br

#SVN20
Quando preencho os campos de senha
    Quando preencho "senha" com ${USUARIO_VALIDO_SENHA}
    Quando preencho "nova_senha" com ${USUARIO_SALVANOTA2_SENHA2}
    Quando preencho "senha_confirmacao" com ${USUARIO_SALVANOTA2_SENHA2}

Quando preencho os campos de senha padrões
    Quando preencho "senha" com ${USUARIO_SALVANOTA2_SENHA2}
    Quando preencho "nova_senha" com ${USUARIO_VALIDO_SENHA}
    Quando preencho "senha_confirmacao" com ${USUARIO_VALIDO_SENHA}