*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Deve poder remover o Darth Vader
    [Tags]    swipe
    Start session
    Get started
    Navigate to     Star Wars
    Go to item     Lista    Lista
    ${positions_inital}    Get Element Location    //android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@resource-id, "indicator")]
    ${positions_finals}    Get Element Location    //android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@content-desc, "Icon")]
    ${start_x}    Set Variable    ${positions_inital}[x]
    ${start_y}    Set Variable    ${positions_inital}[y]
    ${offset_x}    Set Variable    ${positions_finals}[x]
    ${offset_y}    Set Variable    ${positions_inital}[y]
    Swipe     ${start_x}    ${start_y}    ${offset_x}    ${offset_y}    1100
    Click Element    com.qaxperience.yodapp:id/btnRemove
    #Wait Until Page Contains    Item removido!
    Wait Until Page Does Not Contain    Darth Vader
    Close session