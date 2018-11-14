*** Settings ***
Library    Selenium2Library    
Library    api
Suite Setup    Setup For WebClient Suite

*** Variables ***
${HOME_PAGE_URL}    https://gamevui.vn/

*** Keywords ***
Setup For WebClient Suite
    [Documentation]  Makes an initial setup needed before executing the set of suites.
    
    ${COOKIE}=    Get Cookie Api    ${USER_NAME}    ${PASSWORD}
    Set Global Variable    ${COOKIE}    ${COOKIE}
    Open Browser    ${HOME_PAGE_URL}    browser=chrome    alias=MainUser