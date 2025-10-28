*** Settings ***
Documentation    Este teste serve meramente para tentar agendar a tão aguardada renovação de AR :)

Resource    ../resources/try-schedule.resource
Suite Setup    Carregar Variaveis
Test Teardown    Close Browser

*** Test Cases ***
Verificar Se A Renovação Automática Avançou de Status
    [Documentation]    O teste falha se o status for diferente de "Pedido Aguarda Avaliação"

    Entrar No Portal
    Fazer Login
    Validar Se Houve Alteração No Status