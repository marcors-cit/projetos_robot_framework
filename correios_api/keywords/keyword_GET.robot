*** Settings ***
Documentation       A resource file with reusable keywords and variables.
...                 The system specific keywords created here form our own
...                 domain specific language. They utilize keywords provided
...                 by the imported SeleniumLibrary.
Library             SeleniumLibrary
Library             DebugLibrary
Library             RequestsLibrary
Library             Collections


*** Variables ***

${CEP_VALIDO}               13086-510
${CEP_INEXISTENTE}          99999-999
${CEP_INVALIDO}             $@%-*()
${CEP_VAZIO}
${HOST}                     https://viacep.com.br/ws
${HOST_cont}                json/
${STATUS_200}               200
${STATUS_400}               400
${STATUS_404}               404
${LOGRADOURO_CEP_VALIDO}    Rua Doutor Ricardo Benetton Martins
${BAIRRO_CEP_VALIDO}        Polo II de Alta Tecnologia (Campinas)
${LOCALIDADE_CEP_VALIDO}    Campinas
${UF_CEP_VALIDO}            SP
${ERRO}                     True

*** Keywords ***

#1. Cenário: Buscar por CEP válido (200 - OK)
Dado que esteja conectado na API "viacep"
    Create Session          Consulta_CEP    ${HOST}/${CEP_VALIDO}/${HOST_cont}

Quando o usuário consultar o CEP "13086-510"
    ${RETORNO_GET}=        Get Request      Consulta_CEP        /    timeout=3
    Log                 Resposta: ${RETORNO_GET.text}
    Set Test Variable       ${RETORNO_GET}

Então deve ser retornado status "200"
    Should Be Equal As Strings   ${RETORNO_GET.status_code}     ${STATUS_200}
    Log             Status Code Retornado: ${RETORNO_GET.status_code} -- Status Code Esperado: ${STATUS_200}

E o CEP apresentado deve ser o mesmo informado na consulta
    Should Be Equal As Strings   ${RETORNO_GET.status_code}     ${STATUS_200}

E o logradouro: "Rua Doutor Ricardo Benetton Martins"
    Dictionary Should Contain Item  ${RETORNO_GET.json()}  logradouro   ${LOGRADOURO_CEP_VALIDO}

E o bairro: "Polo II de Alta Tecnologia (Campinas)"
    Dictionary Should Contain Item  ${RETORNO_GET.json()}  bairro   ${BAIRRO_CEP_VALIDO}

E a localidade: "Campinas"
    Dictionary Should Contain Item  ${RETORNO_GET.json()}  localidade   ${LOCALIDADE_CEP_VALIDO}

E o uf: "SP"
    Dictionary Should Contain Item  ${RETORNO_GET.json()}  uf   ${UF_CEP_VALIDO}




#2. Cenário: Buscar por CEP inexistente (200 - OK)
Quando o usuário consultar o CEP "99999-999"
    Create Session          Consulta_CEP    ${HOST}/${CEP_INEXISTENTE}/${HOST_cont}
    ${RETORNO_GET}=        Get Request      Consulta_CEP        /    timeout=3
    Log                 Resposta: ${RETORNO_GET.text}
    Set Test Variable       ${RETORNO_GET}

E o erro: true
    Dictionary Should Contain Item  ${RETORNO_GET.json()}  erro   ${ERRO}





#3. Cenário: Buscar por CEP inválido (400 - Bad Request)
Quando o usuário consultar o CEP "$@%-*()"
    Create Session          Consulta_CEP    ${HOST}/${CEP_INVALIDO}/${HOST_cont}
    ${RETORNO_GET}=        Get Request      Consulta_CEP        /    timeout=3
    Log                 Resposta: ${RETORNO_GET.text}
    Set Test Variable       ${RETORNO_GET}

Então deve ser retornado status "400"
    Should Be Equal As Strings   ${RETORNO_GET.status_code}     ${STATUS_400}
    Log             Status Code Retornado: ${RETORNO_GET.status_code} -- Status Code Esperado: ${STATUS_400}





#4. Cenário: Buscar por CEP "vazio" (404 - Not Found)
Quando o usuário consultar o CEP ""
    Create Session          Consulta_CEP    ${HOST}/${CEP_VAZIO}/${HOST_cont}
    ${RETORNO_GET}=        Get Request      Consulta_CEP        /    timeout=3
    Log                 Resposta: ${RETORNO_GET.text}
    Set Test Variable       ${RETORNO_GET}

Então deve ser retornado status "404"
    Should Be Equal As Strings   ${RETORNO_GET.status_code}     ${STATUS_404}
    Log             Status Code Retornado: ${RETORNO_GET.status_code} -- Status Code Esperado: ${STATUS_404}