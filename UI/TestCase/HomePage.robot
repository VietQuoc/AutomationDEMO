*** Settings ***
Library    Selenium2Library
Library    ../../API/api.py
Resource    ../Keyword/HomePage.robot
*** Variables ***
# ${USER_NAME}    01672361998    
# ${PASS_WORD}    12345678

*** Test Cases ***
Navigate To Home Page And verify It Loaded Successfully
    # Update Account Info Via Api    ${COOKIE}    Chú   Nguyen Viet Quoc    Đà Nẵng - Quảng Nam
       
    Goto Home Page
    Click Close Ad Button 