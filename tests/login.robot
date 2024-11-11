*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Deve efetuar o login com sucesso
    [Tags]    loginSuccess
    Start session
    Get started
    Navigate to     Formulários
    Go to item     Login    Login
    # Objetivo do caso de teste
    Input Text    com.qaxperience.yodapp:id/etEmail    yoda@qax.com
    Input Password    com.qaxperience.yodapp:id/etPassword    jedi
    Click Element    com.qaxperience.yodapp:id/btnSubmit
    Wait Until Page Contains    Boas vindas, logado você está.
    Close session

Não deve efetuar o login com senha incorreta
    [Tags]    loginFailedPass
    Start session
    Get started
    Navigate to     Formulários
    Go to item     Login    Login
    # Objetivo do caso de teste
    Input Text    com.qaxperience.yodapp:id/etEmail    yoda@qax.com
    Input Password    com.qaxperience.yodapp:id/etPassword    1234
    Click Element    com.qaxperience.yodapp:id/btnSubmit
    Wait Until Page Contains    Oops! Credenciais incorretas.
    Close session