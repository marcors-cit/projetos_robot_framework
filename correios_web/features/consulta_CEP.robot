*** Settings ***
Documentation     Acesso à pagina dos Correios para busca de CEPs
Resource         ../keywords/keyword_consulta_CEP.robot
Test Teardown     Close Browser


*** Test Cases ***

1. Cenário: Buscar por CEP válido (SP)
    [Tags]  smoke
    Dado que eu esteja na Página dos Correios
    Quando eu informar o CEP "13086-510" no campo "Busca CEP ou Endereço"
    Então é apresentada a Página "buscaCep"
    E o campo "Logradouro/Nome": "Rua Doutor Ricardo Benetton Martins"
    E o "Bairro/Distrito": "Polo II de Alta Tecnologia (Campinas)"
    E a "Localidade/UF: "Campinas/SP"
    E o "CEP": 13086-510


2. Cenário: Buscar por CEP inválido
    [Tags]  invalido
    Dado que eu esteja na Página dos Correios
    Quando eu informar "!@$%*(" no campo "Busca CEP ou Endereço"
    Então é apresentada a Página "buscaCep"
    E a mensagem "DADOS INVALIDOS/NAO INFORMADO"


3. Cenário: Buscar por CEP inexistente
    [Tags]  inexistente
    Dado que eu esteja na Página dos Correios
    Quando eu informar "99999-999" no campo "Busca CEP ou Endereço"
    Então é apresentada a Página "buscaCep"
    E a mensagem "DADOS NAO ENCONTRADOS"


4. Cenário: Buscar por CEP válido (RJ)
    [Tags]  RJ
    Dado que eu esteja na Página dos Correios
    Quando eu informar o CEP "20020-021" no campo "Busca CEP ou Endereço"
    Então é apresentada a Página "buscaCep"
    E o campo "Logradouro/Nome": "Rua Santa Luzia - até 405 - lado ímpar"
    E o "Bairro/Distrito": "Centro"
    E a "Localidade/UF: "Rio de Janeiro/RJ"
    E o "CEP": 20020-021
