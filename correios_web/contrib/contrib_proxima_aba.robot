*** Settings ***
Documentation           Relação de todas as variáveis das keywords
Library                 SeleniumLibrary


*** Keywords ***

contrib_proxima_aba
    @{windows} =        List Windows
    ${numWindows} =     Get Length      ${windows}
    ${indexLast} =      Evaluate        ${numWindows}-1
    Should Be True                      ${numWindows} > 1
    Select Window                       @{windows}[${indexLast}]
