*** Settings ***
Library    ExtendedSelenium2Library

*** Variables ***
${CLOSE_AD_BUTTON}    //a[normalize-space()='Đóng X']
${HOME_PAGE_URL}      https://gamevui.vn/
${USERNAME_LABLE}     //span[@class='user-name']
*** Keywords ***
Goto Home Page
    Go To    ${HOME_PAGE_URL}

Click Close Ad Button
    Wait Until Page Contains Element    ${CLOSE_AD_BUTTON}    ${SHORT_TIME_WAIT}
    Click Element    ${CLOSE_AD_BUTTON}
    
Verify Username Display On Home Page
    Wait Until Element Is Visible    ${USERNAME_LABLE}    ${MEDIUM_TIME_WAIT}