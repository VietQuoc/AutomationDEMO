*** Settings ***
Library    api
Suite Setup    Setup For WebClient Suite

*** Keywords ***
Setup For WebClient Suite
    [Documentation]  Makes an initial setup needed before executing the set of suites.
    
    ${COOKIE}=    Get Cookie    ${USER_NAME}    ${PASSWORD}
    Set Global Variable    ${COOKIE}    ${COOKIE}