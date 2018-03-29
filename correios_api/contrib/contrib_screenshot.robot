*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           DateTime


*** Variables ***
${TYPE OF FILE}     png
${DATE}             Get Current Date
${PATH}             /Projetos_Robot/Correios_web/evidencias
           
  
*** Keywords ***
Capture Screenshot
  [Arguments]               ${filename}
  ${DATE}                   Get Current Date    result_format=%Y%m%d-%H%M
  Set Screenshot Directory  ${PATH}
  Capture Page Screenshot   ${PATH}/${DATE}/${filename}-${DATE}.${TYPE OF FILE}

