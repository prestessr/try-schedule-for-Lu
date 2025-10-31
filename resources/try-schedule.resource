*** Settings ***

Resource    ../config/package.resource

*** Variables ***
${EXPECTED}    Pedido em Avaliação
${AR}
${PWD}
${EMAIL}

*** Keywords ***
Validar Se Houve Alteração No Status
    Element Should Contain    //*[@id="R113297349254706744_Cards"]//span[text()='Pedido em Avaliação']
    ...        ${EXPECTED}    
    ...    PROVAVELMENTE HOUVE ALTERAÇÃO DO STATUS POR PARTE DA AIMA, VÁ CONFERIR

Entrar No Portal
    Open Browser    https://portal-renovacoes.aima.gov.pt/ords/r/aima/aima-pr/pr-home   Chrome
    Wait Until Element Is Visible    //*[@id="B20713197835102452"]

Fazer Login
    Click Element    //*[@id="B20713197835102452"]
    Wait Until Element Is Visible    //*[@id="B90992949754165098"]
    Input Text    //*[@id="P9999_USERNAME"]   ${EMAIL}
    Input Password    //*[@id="P9999_TITULO_RESIDENCIA"]    ${AR}
    Input Password    //*[@id="P9999_PASSWORD"]    ${PWD}
    Click Element    //*[@id="B90992949754165098"]
    Wait Until Element Is Visible    //*[@id="R38628198868352783_heading"]

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