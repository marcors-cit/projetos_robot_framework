*** Settings ***
Documentation     Conection with Myslq Database

Library           DatabaseLibrary

*** Variables ***
${DATABASE_NAME}    xpto
${USER_NAME}        1234
${PASSWORD_BD}      1234
${IP_ADRESS}        172.32.69.999
${PORTA}            3306
  
*** Keywords ***
contrib_database
  Connect to Database   pymysql   ${DATABASE_NAME}  ${USER_NAME}   ${PASSWORD_BD}  ${IP_ADRESS}   ${PORTA}
  log to console    "Conection success..."


