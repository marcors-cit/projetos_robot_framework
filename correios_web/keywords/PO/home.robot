*** Settings ***
Documentation                   Page Object de Funcionalidade Específica
Library                         SeleniumLibrary


*** Variables ***

${HOME_CORREIOS}                http://www.correios.com.br/
${BUSCA_CEP_LITERAL}            Busca CEP ou Endereço
${BUSCA_CEP}                    acesso-busca
${LUPA_CONSULTA_CEP}            //div[@id='content-servicos']/ul//form[@action='http://www.buscacep.correios.com.br/sistemas/buscacep/resultadoBuscaCepEndereco.cfm?t']//input[@title='Consultar']


*** Keywords ***

Home.Load
    Open Browser                ${HOME_CORREIOS}    ${BROWSER}
    Maximize Browser Window


Home.VerifyPage
    Location Should Contain     ${HOME_CORREIOS}
    sleep                           1
    Wait Until Page Contains    ${BUSCA_CEP_LITERAL}


Home.InputCEP
    [Arguments]                 ${CEP_VALIDO}
    Input Text                  ${BUSCA_CEP}        ${CEP_VALIDO}


Home.ConsultaCEP
    Click Element               ${LUPA_CONSULTA_CEP}

