*** Settings ***
Library   ExtendedSelenium2Library
Resource    General_Keywords.robot
*** Variables ***
# URL
${LOGIN_PAGE_URL}           https://gamevui.vn/account/login

# Xpath
${LOGIN_PAGE_HEADER}        //div[@id='header']
${LOGIN_PAGE_TITLE}         //h1[normalize-space()='Đăng nhập tài khoản']
${FACEBOOK_LOGIN_BUTTON}    //a[contains(@class,'facebook') and contains(normalize-space(),'Đăng nhập qua Facebook')]
${GOOGLE_LOGIN_BUTTON}      //a[contains(@class,'google')  and contains(normalize-space(),'Đăng nhập qua Google')]
${USERNAME_TXT}             //input[@id='UserName']
${PASSWORD_TXT}             //input[@id='Password']
${LOGIN_BUTTON}             //button[normalize-space()='Đăng nhập']
${SIGNUP_LINK}              //a[normalize-space()='Đăng ký']
${FORGET_USER_LINK}         //a[normalize-space()='Lấy lại tài khoản?']

#COLOR
${LOGIN_BUTTON_COLOR}             rgba(218, 37, 28, 1)
${GOOGLE_LOGIN_BUTTON_COLOR}      rgba(66, 133, 244, 1)
${FACEBOOK_LOGIN_BUTTON_COLOR}    rgba(59, 89, 152, 1)

*** Keywords ***
Goto Login Page
    Go To    ${LOGIN_PAGE_URL}

Verify All Control Show On Login Page
    [Documentation]    Verify all control show on this page
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${LOGIN_PAGE_HEADER}    ${MEDIUM_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${LOGIN_PAGE_TITLE}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${FACEBOOK_LOGIN_BUTTON}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${GOOGLE_LOGIN_BUTTON}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${USERNAME_TXT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${PASSWORD_TXT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${LOGIN_BUTTON}                      
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${SIGNUP_LINK}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${FORGET_USER_LINK} 

Verify Button Color On Login Page
    [Documentation]    Verify button login, login via google, login via facebook
    
    Run Keyword And Continue On Failure    Verify Color Of Css Element    ${LOGIN_BUTTON}             ${LOGIN_BUTTON_COLOR}
    Run Keyword And Continue On Failure    Verify Color Of Css Element    ${GOOGLE_LOGIN_BUTTON}      ${GOOGLE_LOGIN_BUTTON_COLOR}
    Run Keyword And Continue On Failure    Verify Color Of Css Element    ${FACEBOOK_LOGIN_BUTTON}    ${FACEBOOK_LOGIN_BUTTON_COLOR}

Log In
    [Documentation]    Log in to this page via UI with given username and password
    [Arguments]    ${username}    ${password}
    
    Input Text If Element Is Visible    ${USERNAME_TXT}    ${username}
    Input Text If Element Is Visible    ${PASSWORD_TXT}    ${password}
    Click If Element Is Visible    ${LOGIN_BUTTON}
    
