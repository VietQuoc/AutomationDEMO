*** Settings ***
Library    ExtendedSelenium2Library
Library    ../../API/api.py
Resource    ../Keyword/HomePage_Keyword.robot

*** Variables ***
#Data
${NUMBER_CATEGORY}          109

*** Test Cases ***
Navigate To Home Page And verify It Loaded Successfully
    Goto Home Page
    Verify All Category Of Game Display When Hover To Category Button    ${NUMBER_CATEGORY}

Verify That User Can Navigate To Category Page When Click Category Link
    [Setup]    Goto Home Page
    Select Category Game    Ninja
    Verify That Category Page Loaded Successfully    Ninja