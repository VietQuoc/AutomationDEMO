*** Settings ***
Library     ExtendedSelenium2Library
Resource    ../Keyword/LoginPage_Keyword.robot
Resource    ../Keyword/HomePage_Keyword.robot
Force Tags    all

*** Test Cases ***
Verify UI On Login Page
    [Documentation]    Verify All control display on login page
    
    Goto Login Page
    Verify All Control Show On Login Page
    Verify Button Color On Login Page
    
Verify That User Can Login Successfully With Correct Username And Password
    [Documentation]    Verify that user can login to main page
    
    Log In    ${USER_NAME}    ${PASSWORD}
    Verify Username Display On Home Page
    