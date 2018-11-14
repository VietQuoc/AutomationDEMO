*** Settings ***
Library    Selenium2Library
Library    RequestsLibrary

*** Variables ***
${CLOSE_AD_BUTTON}    //a[normalize-space()='Đóng X']
${HOME_PAGE_URL}    https://gamevui.vn/
*** Keywords ***
Goto Home Page
    Go To    ${HOME_PAGE_URL}

Click Close Ad Button
    Wait Until Page Contains Element    ${CLOSE_AD_BUTTON}    10s
    Click Element    ${CLOSE_AD_BUTTON}       