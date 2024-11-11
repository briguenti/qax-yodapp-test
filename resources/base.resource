*** Settings ***

Library    AppiumLibrary

# Variaveis Globais em caixa alta, pois poderão ser identificada de maneira facil para usar em outros casos de teste
*** Variables ***
${START}    QAX

*** Keywords ***
Start session
    Open Application    http://localhost:4723    platformName=Android
    ...                 deviceName=Android Emulator    automationName=UIAutomator2    
    ...                 app=${EXECDIR}/app/yodapp-beta.apk    udid=emulator-5554    
    ...                 autoGrantPermissions=true

Get started
    Wait Until Page Contains    ${START}    5
    Click Text    ${START}
    
Navigate to
    [Arguments]    ${item}
    ${menu}    Set Variable    //*[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${menu}    5
    Click Element    ${menu}

    ${menu_item}    Set Variable    //*[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="${item}"]

    Wait Until Element Is Visible    ${menu_item}    5
    Click Element    ${menu_item}

Go to item
    [Arguments]    ${item}    ${checkpoint}
    ${select}    Set Variable    //*[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="${item}"]
    Click Element    ${select}
    Wait Until Page Contains    ${checkpoint}

Select tech
    [Arguments]    ${tech}
    Click Element    //*[@resource-id="com.qaxperience.yodapp:id/checkboxButton" and contains(@text, "${tech}")]

Select level
    [Arguments]    ${level}
    Click Element    com.qaxperience.yodapp:id/spinnerJob
    Wait Until Element Is Visible    //android.widget.ListView
    Click Text    ${level}
    
Close session
    Close Application