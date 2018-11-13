*** Settings ***
Library    Selenium2Library
Library    RequestsLibrary
Library    ../../API/api.py
*** Variables ***
${USER_NAME}    01672361998    
${PASS_WORD}    12345678

*** Test Cases ***
hihihi
    Update Account Info Via Api    ${USER_NAME}    ${PASSWORD}    Anh   Nguyen Viet Nam    Đà Nẵng - Quảng Nam 