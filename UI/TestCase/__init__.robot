*** Settings ***
Library    ExtendedSelenium2Library    
Library    api
Suite Setup    Setup For WebClient Suite
Suite Teardown    Close All Browsers

*** Keywords ***
Setup For WebClient Suite
    [Documentation]  Makes an initial setup needed before executing the set of suites.
    
    ${COOKIE}=    Get Cookie Api    ${USER_NAME}    ${PASSWORD}
    Set Global Variable    ${COOKIE}    ${COOKIE}
    Open Browser    about:blank    browser=chrome    alias=MainUser
    Maximize Browser Window