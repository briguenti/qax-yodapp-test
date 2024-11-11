*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Deve realizar um clique simples
    [Tags]    shortClick
    Start session
    Get started
    Navigate to     Clique em Botões
    Go to item     Clique simples    Botão clique simples
    # Objetivo do caso de teste
    Click Element    com.qaxperience.yodapp:id/short_click
    Wait Until Page Contains    Isso é um clique simples
    Close session

Deve realizar um clique looongo
    [Tags]    longClick
    Start session
    Get started
    Navigate to    Clique em Botões
    Go to item    Clique longo    Botão clique longo
    # Objetivo do caso de teste
    ${positions}    Get Element Location    com.qaxperience.yodapp:id/long_click
    Tap With Positions    1000    ${${positions}[x], ${positions}[y]}
    Wait Until Page Contains    Isso é um clique longo
    Close session