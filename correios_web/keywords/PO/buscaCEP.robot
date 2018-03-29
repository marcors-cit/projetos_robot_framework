*** Settings ***
Documentation                       Page Object de Funcionalidade Específica
Library                             SeleniumLibrary


*** Variables ***

${URL_BUSCA_CEP}                    http://www.buscacep.correios.com.br/sistemas/buscacep/resultadoBuscaCepEndereco.cfm?t
${TEXT_BUSCA_CEP}                   Busca CEP - Endereço
${MSG_ERRO_INVALIDO}                DADOS INVALIDOS/NAO INFORMADO
${MSG_ERRO_INEXISTENTE}             DADOS NAO ENCONTRADOS


*** Keywords ***

buscaCEP.VerifyPage
    Location Should Contain         ${URL_BUSCA_CEP}
    Wait Until Page Contains        ${TEXT_BUSCA_CEP}


buscaCEP.Logradouro
    [Arguments]                     ${LOGRADOURO}
    Wait Until Page Contains        ${LOGRADOURO}


buscaCEP.Bairro
    [Arguments]                     ${BAIRRO}
    Wait Until Page Contains        ${BAIRRO}


buscaCEP.Localidade
    [Arguments]                     ${LOCALIDADE}
    Wait Until Page Contains        ${LOCALIDADE}


buscaCEP.CEP
    [Arguments]                     ${CEP}
    Wait Until Page Contains        ${CEP}


buscaCEP.MsgDadosInvalidos
    Wait Until Page Contains        ${MSG_ERRO_INVALIDO}


buscaCEP.MsgDadosInexistentes
    Wait Until Page Contains        ${MSG_ERRO_INEXISTENTE}