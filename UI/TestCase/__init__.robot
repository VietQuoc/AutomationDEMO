*** Settings ***
Library    ExtendedSelenium2Library    
Library    ../../API/api.py
Suite Setup    Setup For WebClient Suite
Suite Teardown    Close All Browsers

*** Keywords ***
Setup For WebClient Suite
    [Documentation]  Makes an initial setup needed before executing the set of suites.
    
    ${SESSION}=    Get Session Api    ${USER_NAME}    ${PASSWORD}
    Set Global Variable    ${SESSION}    ${SESSION}
    Open Browser    about:blank    browser=${BROWSER}    alias=MainUser
    Maximize Browser Window