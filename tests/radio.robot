*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Deve selecionar as tecnologias que usam Appium
    [Tags]    radioButton
    Start session
    Get started
    Navigate to     Check e Radio
    Go to item     Botões de radio    Escolha sua linguagem preferida
    # Objetivo do caso de teste
    Click Element    //*[@resource-id="com.qaxperience.yodapp:id/radioButton" and contains(@text, "Java ")]
    Sleep    5
    Close session