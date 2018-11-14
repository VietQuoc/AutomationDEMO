*** Settings ***
Library    ExtendedSelenium2Library
Library    ../../API/api.py
Resource    ../Keyword/HomePage_Keyword.robot

*** Test Cases ***
Navigate To Home Page And verify It Loaded Successfully
    # Update Account Info Via Api    ${COOKIE}    Chú   Nguyen Viet Quoc    Đà Nẵng - Quảng Nam
       
    Goto Login Page
    # Click Close Ad Button 