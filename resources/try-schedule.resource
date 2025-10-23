*** Settings ***

Resource    ../config/package.resource

*** Variables ***
${ERROR_RENOV}    A sua situação de dívida com a Segurança Social e a Autoridade Tributária está em revisão. Uma vez validada, poderá fazer os pedidos. Por favor volte mais tarde.
${AR}
${PWD}
${EMAIL}

*** Keywords ***
Executar Tentativa De Agendamento Online
    [Documentation]    Isto apenas verifica se há mensagem de pendência de validação por parte da AIMA

    
    Open Browser    https://portal-renovacoes.aima.gov.pt/ords/r/aima/aima-pr/pr-home   Chrome
    Wait Until Element Is Visible    //*[@id="B12371037102505817"]
    Click Element    //*[@id="B12371037102505817"]
    Wait Until Element Is Visible    //*[@id="B82650789021568463"]
    Input Text    //*[@id="P9999_USERNAME"]   ${EMAIL}
    Input Password    //*[@id="P9999_TITULO_RESIDENCIA"]    ${AR}
    Input Password    //*[@id="P9999_PASSWORD"]    ${PWD}
    Click Element    //*[@id="B82650789021568463"]
    Wait Until Element Is Visible    //*[@id="R28271233697281696_heading"]


    Element Should Contain    //*[@id="R55609004536556234"]/div/div[2]/div[2]/div/strong/ul/li
    ...        ${ERROR_RENOV}    
    ...    PROVAVELMENTE DÁ PRA RENOVAR! CORRE!


Carregar Variaveis

    Load Env File

    Set Log Level    NONE  
    ${PWD}    Get Env Variable    SENHA    
    LOG    ${PWD}    formatter=repr
    VAR    ${PWD}    ${PWD}    scope=SUITE 
    ${EMAIL}    Get Env Variable    EMAIL
    VAR    ${EMAIL}    ${EMAIL}    scope=SUITE    
    ${AR}    Get Env Variable    ARDOC
    VAR    ${AR}    ${AR}    scope=SUITE
    Set Log Level    INFO    

    RETURN    