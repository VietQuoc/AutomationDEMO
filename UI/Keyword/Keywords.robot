*** Settings ***
Library    ExtendedSelenium2Library

*** Keywords ***
Input Text If Element Is Visible
    [Documentation]    Wait for the element is visible and input text to this element
    [Arguments]    ${locator}    ${text}    ${timeout}=${SHORT_TIME_WAIT}
    
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}    
    
Click If Element Is Visible
    [Documentation]    Wait for the element is visible and click this element
    [Arguments]    ${locator}    ${timeout}=${SHORT_TIME_WAIT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element    ${locator}
    
Verify Color Of Css Element
    [Documentation]    Get color of element via css and compare with expected color
    [Arguments]    ${locator}    ${color}
    
    Wait Until Element Is Visible    ${locator}  
    ${element}=    Get Webelement    ${locator}
    ${element_color}=    Call Method    ${element}    value_of_css_property    background-color
    Should Be Equal As Strings    ${color}    ${element_color}
