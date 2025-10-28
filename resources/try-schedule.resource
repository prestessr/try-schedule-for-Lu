*** Settings ***

Resource    ../config/package.resource

*** Variables ***
${EXPECTED}    Pedido Aguarda Avaliação
${AR}
${PWD}
${EMAIL}

*** Keywords ***
Validar Se Houve Alteração No Status
    Element Should Contain    //*[@id="R104955188522110109_Cards"]/div/div[3]/ul/li/div/div[1]/div[2]/span[2]
    ...        ${EXPECTED}    
    ...    PROVAVELMENTE HOUVE ALTERAÇÃO DO STATUS POR PARTE DA AIMA, VÁ CONFERIR

Entrar No Portal
    Open Browser    https://portal-renovacoes.aima.gov.pt/ords/r/aima/aima-pr/pr-home   Chrome
    Wait Until Element Is Visible    //*[@id="B12371037102505817"]

Fazer Login
    Click Element    //*[@id="B12371037102505817"]
    Wait Until Element Is Visible    //*[@id="B82650789021568463"]
    Input Text    //*[@id="P9999_USERNAME"]   ${EMAIL}
    Input Password    //*[@id="P9999_TITULO_RESIDENCIA"]    ${AR}
    Input Password    //*[@id="P9999_PASSWORD"]    ${PWD}
    Click Element    //*[@id="B82650789021568463"]
    Wait Until Element Is Visible    //*[@id="R28271233697281696_heading"]

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