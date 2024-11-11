*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Deve selecionar o seu nível
    [Tags]    spinner
    Start session
    Get started
    Navigate to     Formulários
    Go to item     Cadastro    Crie sua conta.
    # Objetivo do caso de teste
    Input Text    com.qaxperience.yodapp:id/etUsername    Vinimon
    Input Text    com.qaxperience.yodapp:id/etEmail    yoda@qax.com
    Input Password    com.qaxperience.yodapp:id/etPassword    jedi
    Select level    Sith
    Click Element    com.qaxperience.yodapp:id/btnSubmit
    Wait Until Page Contains    Tudo certo, boas vindas ao Yodapp!
    Close session