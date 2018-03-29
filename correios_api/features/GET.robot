*** Settings ***
Documentation     Consulta de CEPS pela API aberta: https://viacep.com.br/ws/<CEP>/json/
Resource         ../keywords/keyword_GET.robot



*** Test Cases ***


1. Cenário: Buscar por CEP válido (200 - OK)
    [Tags]  smoke
    Dado que esteja conectado na API "viacep"
    Quando o usuário consultar o CEP "13086-510"
    Então deve ser retornado status "200"
    E o CEP apresentado deve ser o mesmo informado na consulta
    E o logradouro: "Rua Doutor Ricardo Benetton Martins"
    E o bairro: "Polo II de Alta Tecnologia (Campinas)"
    E a localidade: "Campinas"
    E o uf: "SP"


2. Cenário: Buscar por CEP inexistente (200 - OK)
    [Tags]  inexistente
    Dado que esteja conectado na API "viacep"
    Quando o usuário consultar o CEP "99999-999"
    Então deve ser retornado status "200"
    E o erro: true


3. Cenário: Buscar por CEP inválido (400 - Bad Request)
    [Tags]  inválido
    Dado que esteja conectado na API "viacep"
    Quando o usuário consultar o CEP "$@%-*()"
    Então deve ser retornado status "400"


4. Cenário: Buscar por CEP "vazio" (404 - Not Found)
    [Tags]  vazio
    Dado que esteja conectado na API "viacep"
    Quando o usuário consultar o CEP ""
    Então deve ser retornado status "404"