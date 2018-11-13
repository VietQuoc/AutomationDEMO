*** Settings ***
Library    Selenium2Library
Library    ../../API/api.py
*** Variables ***
# ${USER_NAME}    01672361998    
# ${PASS_WORD}    12345678

*** Test Cases ***
hihihi
    Update Account Info Via Api    ${COOKIE}    Chú   Nguyen Viet Quoc    Đà Nẵng - Quảng Nam 