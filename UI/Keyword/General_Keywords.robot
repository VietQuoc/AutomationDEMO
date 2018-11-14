*** Settings ***
Library    ExtendedSelenium2Library
Library    String
Library    DateTime

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

Replace String With Given Text
    [Documentation]    Use keyword for some case of strings and locators which have the same structure
    [Arguments]    ${string}    ${text}
    
    ${new_string}=    Replace String    ${string}    $$    ${text}    
    [Return]    ${new_string}
    
GenerateRandonDateOfBirth 
    [Arguments]    ${minimumAge}=13
    # ${date}=    Get Current Date
    # ${currentTimeStamp}=     Convert Date    ${date}    epoch    exclude_millis=yes
    # ${currentYear}=    Convert Date    ${date}    result_format=%Y
     Log    asdjkaskd    
    # ${compareYear}=    Convert To Integer    ${currentYear}
    # ${numberYears}=    Convert To Integer    ${minimumAge}
    # ${compareYear}=    Run Keyword    Evaluate    ${compareYear}-${numberYears}    
    # ${secsPerYear}=    Set Variable    31557600
    # ${subtractSeconds}=    Run Keyword    Evaluate    ${minimumAge}*${secsPerYear}
    # ${minAgeTimeStamp}=    Run Keyword    Evaluate    ${currentTimeStamp}-${subtractSeconds}
    # ${execStr}=    Set Variable    random.randint(1, ${minAgeTimeStamp})
 
    # :FOR ${i} IN RANGE 100
    # \ ${randDate}= Evaluate ${execStr} modules=random,sys
    # \ ${randomYear}= Convert Date ${randDate} result_format=%Y
    # \ Exit For Loop If ${compareYear} > ${randomYear}
    # ${randYear}= Convert Date ${randDate} result_format=%Y
    # ${randMonth}= Convert Date ${randDate} result_format=%m
    # ${randDay}= Convert Date ${randDate} result_format=%d
 
     # [Return] ${randYear} ${randMonth} ${randDay}