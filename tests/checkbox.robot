*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Deve selecionar as tecnologias que usam Appium
    [Tags]    checkbox
    Start session
    Get started
    Navigate to     Check e Radio
    Go to item     Checkbox    Marque as techs que usam Appium
    # Objetivo do caso de teste
    @{techs}    Create List    Ruby    Python    Java    Javascript    C#    Robot Framework
    FOR  ${tech}  IN  @{techs}
        Select tech    ${tech}
    END    
    Close session