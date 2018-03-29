*** Settings ***
Documentation     Conection with Myslq Database

Library           DatabaseLibrary

*** Variables ***
${DATABASE_NAME}    bluetec
${USER_NAME}        root
${PASSWORD_BD}      root
${IP_ADRESS}        172.32.69.205
#${IP_ADRESS}        172.32.66.121
${PORTA}            3306
  
*** Keywords ***
inicialize_conection
  Connect to Database   pymysql   ${DATABASE_NAME}  ${USER_NAME}   ${PASSWORD_BD}  ${IP_ADRESS}   ${PORTA}
  log to console    "Conection success..."


