*** Settings ***
Documentation    Documento da API: http://api.notasimples.com.br/swagger/index.html
Library          RequestsLibrary
Library          Collections

*** Variables ***
${URL_API}               http://api.notasimples.com.br/
#${URL_API}              http://localhost:2178/
${URL_APIENTERPRISE}     https://testeapienterprise.nfemail.com.br/api
#${URL_APIENTERPRISE}    http://localhost:2178/api
${SLEEP}                 2

*** Keywords ***

Conectar API
    Create Session       api    ${URL_API}

Obter Dados do usuário logado
    ${RESPOSTA}          Get Request    api    Usuario
    #Log           ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Conferir status code
    [Arguments]                   ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Autenticar com login "${EMAIL}", senha "${SENHA}" e sistema "${SISTEMA}"
    ${HEADERS}              Create Dictionary      Content-Type=application/json
    ${RESPOSTA}             Post On Session           api                              autenticacao/login
    ...                     data={"email": "${EMAIL}","senha": "${SENHA}","sistema": "${SISTEMA}"}
    ...                     headers=${HEADERS}
    Set Test Variable       ${RESPOSTA}

Apagar dados de teste
    Create Session          api                      ${URL_API}
    ${HEADERS}              Create Dictionary        Content-Type=application/json
    ${RESPOSTA}             Post On Session             api                             teste/exclusaotesterobot
    ...                     data="TESTENF1M@L!@#"

    ...                     headers=${HEADERS}
    Set Test Variable       ${RESPOSTA}
    Conferir status code    200

Incluir mensalidade teste
    Create Session          api                      ${URL_API}
    ${HEADERS}              Create Dictionary        Content-Type=application/json
    ${RESPOSTA}             Post On Session             api                             teste/incluirmensalidadeteste
    ...                     data="TESTENF1M@L!@#"
    ...                     headers=${HEADERS}
    Set Test Variable       ${RESPOSTA}
    Conferir status code    200

Registrar pagamento de mensalidade teste
    Create Session          api                      ${URL_API}
    ${HEADERS}              Create Dictionary        Content-Type=application/json
    ${RESPOSTA}             Post On Session             api                             teste/baixarmensalidadeteste
    ...                     data="TESTENF1M@L!@#"
    ...                     headers=${HEADERS}
    Set Test Variable       ${RESPOSTA}
    Conferir status code    200

Apagar dados de teste de "${ENTIDADE}" com id "${ID}"
    Create Session          apiEnterprise            ${URL_APIENTERPRISE}
    ${HEADERS}              Create Dictionary        Content-Type=application/json
    ${RESPOSTA}             Post On Session             apiEnterprise                    teste/excluircadastro
    ...                     data={"token": "TESTENF1M@L!@#","entidade": "${ENTIDADE}","id": "${ID}"}
    ...                     headers=${HEADERS}
    Set Test Variable       ${RESPOSTA}
    Conferir status code    200