*** Settings ***
Documentation               A resource file with reusable keywords and variables.
...                         The system specific keywords created here form our own
...                         domain specific language. They utilize keywords provided
...                         by the imported SeleniumLibrary.
Library                     SeleniumLibrary
Library                     DebugLibrary
Resource                    ../keywords/PO/home.robot
Resource                    ../keywords/PO/buscaCEP.robot
Resource                    ../contrib/contrib_screenshot.robot
Resource                    ../contrib/contrib_proxima_aba.robot



*** Variables ***

${BROWSER}                  chrome

# Massa
${CEP_SP}                   13086-510
${LOGRADOURO_SP}            Rua Doutor Ricardo Benetton Martins
${BAIRRO_SP}                Polo II de Alta Tecnologia
${LOCALIDADE_SP}            Campinas/SP
${CEP_INVALIDO}             !@$%*(
${CEP_INEXISTENTE}          99999-999
${CEP_RJ}                   20020-021
${LOGRADOURO_RJ}            Rua Santa Luzia - até 405 - lado ímpar
${BAIRRO_RJ}                Centro
${LOCALIDADE_RJ}            Rio de Janeiro/RJ


*** Keywords ***

# 1. Cenário: Buscar por CEP do Pólis Campinas-SP
Dado que eu esteja na Página dos Correios
    Home.Load
    Home.VerifyPage

Quando eu informar o CEP "13086-510" no campo "Busca CEP ou Endereço"
    Home.InputCEP           ${CEP_SP}
    Home.ConsultaCEP

Então é apresentada a Página "buscaCep"
    sleep                           1
    contrib_proxima_aba
    buscaCEP.VerifyPage

E o campo "Logradouro/Nome": "Rua Doutor Ricardo Benetton Martins"
    buscaCEP.Logradouro     ${LOGRADOURO_SP}

E o "Bairro/Distrito": "Polo II de Alta Tecnologia (Campinas)"
    buscaCEP.Bairro         ${BAIRRO_SP}

E a "Localidade/UF: "Campinas/SP"
    buscaCEP.Localidade     ${LOCALIDADE_SP}

E o "CEP": 13086-510
    buscaCEP.CEP            ${CEP_SP}
    contrib_screenshot      1_CEP_Polis_Sucesso




# 2. Cenário: Buscar por CEP inválido
Quando eu informar "!@$%*(" no campo "Busca CEP ou Endereço"
    Home.InputCEP           ${CEP_INVALIDO}
    Home.ConsultaCEP

E a mensagem "DADOS INVALIDOS/NAO INFORMADO"
    buscaCEP.MsgDadosInvalidos
    contrib_screenshot      2_CEP_Invalido




#3. Cenário: Buscar por CEP inexistente
Quando eu informar "99999-999" no campo "Busca CEP ou Endereço"
    Home.InputCEP           ${CEP_INEXISTENTE}
    Home.ConsultaCEP

E a mensagem "DADOS NAO ENCONTRADOS"
    buscaCEP.MsgDadosInexistentes
    contrib_screenshot      3_CEP_Inexistente




#4. Cenário: Buscar por CEP válido (RJ)
Quando eu informar o CEP "20020-021" no campo "Busca CEP ou Endereço"
    Home.InputCEP           ${CEP_RJ}
    Home.ConsultaCEP

E o campo "Logradouro/Nome": "Rua Santa Luzia - até 405 - lado ímpar"
    buscaCEP.Logradouro     ${LOGRADOURO_RJ}

E o "Bairro/Distrito": "Centro"
    buscaCEP.Bairro         ${BAIRRO_RJ}

E a "Localidade/UF: "Rio de Janeiro/RJ"
    buscaCEP.Localidade     ${LOCALIDADE_RJ}

E o "CEP": 20020-021
    buscaCEP.CEP            ${CEP_RJ}
    contrib_screenshot      4_CEP_RJ_Sucesso
