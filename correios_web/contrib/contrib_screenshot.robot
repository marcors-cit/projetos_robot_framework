*** Settings ***
Documentation               A resource file with reusable keywords and variables.
...
...                         The system specific keywords created here form our own
...                         domain specific language. They utilize keywords provided
...                         by the imported SeleniumLibrary.
Library                     DateTime


*** Variables ***
${TYPE OF FILE}             png
${DATE}                     Get Current Date
${PATH}                     /projetos_robot_framework/correios_web/features/results/evidencias
           
  
*** Keywords ***
contrib_screenshot
  [Arguments]               ${filename}
  ${DATE}                   Get Current Date    result_format=%Y%m%d-%H%M
  Set Screenshot Directory  ${PATH}
  Capture Page Screenshot   ${PATH}/${filename}-${DATE}.${TYPE OF FILE}

  
  
  
