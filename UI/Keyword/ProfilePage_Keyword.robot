*** Settings ***
Library    Selenium2Library    
Resource    General_Keywords.robot

*** Variables ***
#URL
${PROFILE_PAGE_URL}        https://gamevui.vn/member
${ACCOUNT_EDITOR_PAGE}     https://gamevui.vn/account/profile

#XPATH
${AVATA_ICON}              //div[@class='avatar']
${PROFILE_MENU}            //a[contains(@class,'menu')]
${HOMEPAGE_BUTTON}         //a[@title='Trang chủ']
${MENU_HOMEPAGE_BUTTON}    //a[@class='hdnav']
${MENU_ACCOUNT_BUTTON}     //a[contains(normalize-space(),'Tài kho')]
${MENU_INFO_BUTTON}        //a[normalize-space()='Thông tin']
${MENU_LOGOUT_BUTTON}      //li[@class='logout']//a[normalize-space()='Đăng xuất']

#Account Editor Page
${ACCOUNT_NAME}             //h1[@class='name']
${ACCOUNT_TITLE}            //select[@id='Title']
${ACCOUNT_TITLE_SELECT}     //select[@id='Title']//option[@selected and normalize-space()='$$']
${ACCOUNT_DAY}              //select[@id='BirthdayDay']
${ACCOUNT_DAY_SELECT}       //select[@id='BirthdayDay']//option[@selected and normalize-space()='$$']
${ACCOUNT_MONTH}            //select[@id='BirthdayMonth']
${ACCOUNT_MONTH_SELECT}     //select[@id='BirthdayMonth']//option[@selected and contains(normalize-space(),'$$')]
${ACCOUNT_YEAR}             //select[@id='BirthdayYear']
${ACCOUNT_YEAR_SELECT}      //select[@id='BirthdayYear']//option[@selected and normalize-space()='$$']
${ACCOUNT_GENDER_SELECT}    //label[normalize-space()='$$']//input[@id='Gender']
${ACCOUNT_LOCATION}         //input[@id='Location']
*** Keywords ***
#Action Keyword
Navigate To Account Editor Page From Profile Page
    Click If Element Is Visible    ${PROFILE_MENU}
    Comment    Sleep 0.1s make sure element can be clicked on some case!
    Sleep    0.1s    
    Click If Element Is Visible    ${MENU_ACCOUNT_BUTTON}
    
Navigate To Account Editor Page From URL
    Go To    ${ACCOUNT_EDITOR_PAGE}
    
#Verify Keyword
Verify Profile Page Loaded Successfully
    [Documentation]    Verify All control on Profile Page visible
    
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${AVATA_ICON}         ${SHORT_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${PROFILE_MENU}       ${SHORT_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${HOMEPAGE_BUTTON}    ${SHORT_TIME_WAIT}

Verify Account Editor Page Loaded Successfully
    [Documentation]    Verify All control on Editor Page visible
    
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${ACCOUNT_NAME}         ${SHORT_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${ACCOUNT_TITLE}       ${SHORT_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${ACCOUNT_DAY}    ${SHORT_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${ACCOUNT_MONTH}    ${SHORT_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${ACCOUNT_YEAR}    ${SHORT_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${ACCOUNT_LOCATION}    ${SHORT_TIME_WAIT}
    ${gender_select_locator}=    Replace String With Given Text    ${ACCOUNT_GENDER_SELECT}    Nam
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${gender_select_locator}    ${SHORT_TIME_WAIT}
    ${gender_select_locator}=    Replace String With Given Text    ${ACCOUNT_GENDER_SELECT}    Nữ
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${gender_select_locator}    ${SHORT_TIME_WAIT}
    
Verify Account Name On Editor Page
    [Arguments]    ${name}
    
    Wait Until Element Is Visible    ${ACCOUNT_NAME}
    ${locator_text}=    Get Text    ${ACCOUNT_NAME}
    Should Be Equal As Strings    ${name}    ${locator_text}    
    
Verify Account Title On Editor Page
    [Arguments]    ${title}
    
    ${title_locator}=    Replace String With Given Text    ${ACCOUNT_TITLE_SELECT}    ${title}
    Wait Until Element Is Visible    ${title_locator}
    
Verify Account BirthDay On Editor Page
    [Arguments]    ${day}
    
    ${day_locator}=    Replace String With Given Text    ${ACCOUNT_DAY_SELECT}    ${day}
    Wait Until Element Is Visible    ${day_locator}
    
Verify Account BirthDay Month On Editor Page
    [Arguments]    ${month}
    
    ${month_locator}=    Replace String With Given Text    ${ACCOUNT_MONTH_SELECT}    ${month}
    Wait Until Element Is Visible    ${month_locator}
    
Verify Account BirthDay Year On Editor Page
    [Arguments]    ${year}
    
    ${year_locator}=    Replace String With Given Text    ${ACCOUNT_YEAR_SELECT}    ${year}
    Wait Until Element Is Visible    ${year_locator}
    
Verify Account Gender On Editor Page
    [Arguments]    ${gender}
    
    ${gender_locator}=    Replace String With Given Text    ${ACCOUNT_GENDER_SELECT}    ${gender}
    Wait Until Element Is Visible    ${gender_locator}
    Element Attribute Value Should Be    ${gender_locator}    checked    true    
    
Verify Account Location On Editor Page
    [Arguments]    ${location}
    
    Wait Until Element Is Visible    ${ACCOUNT_LOCATION}
    ${locator_location}=    Get Element Attribute    ${ACCOUNT_LOCATION}    value
    Should Be Equal As Strings    ${locator_location}    ${location}    
    
Verify All Info On Account Editor Correctly
    [Documentation]    Verify all info: name, title, day, month, year, gender, location
    [Arguments]    ${name}    ${title}    ${day}    ${month}    ${year}    ${gender}    ${location}
    
    Run Keyword And Continue On Failure    Verify Account Name On Editor Page    ${name}
    Run Keyword And Continue On Failure    Verify Account Title On Editor Page    ${title}
    Run Keyword And Continue On Failure    Verify Account BirthDay On Editor Page    ${day}
    Run Keyword And Continue On Failure    Verify Account BirthDay Month On Editor Page    ${month}
    Run Keyword And Continue On Failure    Verify Account BirthDay Year On Editor Page    ${year}
    Run Keyword And Continue On Failure    Verify Account Gender On Editor Page    ${gender}
    Run Keyword And Continue On Failure    Verify Account Location On Editor Page    ${location}
