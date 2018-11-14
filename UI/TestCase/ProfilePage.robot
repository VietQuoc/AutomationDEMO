*** Settings ***
Library     ExtendedSelenium2Library
Resource    ../Keyword/LoginPage_Keyword.robot
Suite Setup    Run Keywords    Goto Login Page
...                     AND    Log In    ${USER_NAME}    ${PASSWORD}        
*** Test Cases ***
Navigate To User Profile Page Successfully After Login
        [Documentation]    Navigate To this page from Homepage
        Go To Profile Page
        Verify Profile Page Loaded Successfully