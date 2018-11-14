*** Settings ***
Library    ExtendedSelenium2Library
Resource    General_Keywords.robot

*** Variables ***
#URL
${PROFILE_PAGE_URL}    https://gamevui.vn/member

#XPATH
${AVATA_ICON}              //div[@class='avatar']
${PROFILE_MENU}            //a[contains(@class,'menu')]
${HOMEPAGE_BUTTON}         //a[@title='Trang chủ']
${MENU_HOMEPAGE_BUTTON}    //a[@class='hdnav']
${MENU_ACCOUNT_BUTTON}     //a[normalize-space()='Tài khoản']
${MENU_INFO_BUTTON}        //a[normalize-space()='Thông tin']
${MENU_LOGOUT_BUTTON}      //li[@class='logout']//a[normalize-space()='Đăng xuất']

#Account Editor Page
${ACCOUNT_NAME}             //h1[@class='name']
${ACCOUNT_TITLE}            //select[@id='Title']
${ACCOUNT_TITLE_SELECT}     //select[@id='Title']//option[@selected and normalize-space()='$$']
${ACCOUNT_DAY}              //select[@id='BirthdayDay']
${ACCOUNT_DAY_SELECT}       //select[@id='BirthdayDay']//option[@selected and normalize-space()='$$']
${ACCOUNT_MONTH}            //select[@id='BirthdayMonth']
${ACCOUNT_MONTH_SELECT}     //select[@id='BirthdayMonth']//option[@selected and normalize-space()='$$']
${ACCOUNT_YEAR}             //select[@id='BirthdayYear']
${ACCOUNT_YEAR_SELECT}      //select[@id='BirthdayYear']//option[@selected and normalize-space()='$$']
${ACCOUNT_GENDER_SELECT}    //label[normalize-space()='$$']//input[@id='Gender']
${ACCOUNT_LOCATION}         //input[@id='Location']
*** Keywords ***
Verify Profile Page Loaded Successfully
    [Documentation]    Verify All control on Profile Page visible
    
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${AVATA_ICON}         ${SHORT_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${PROFILE_MENU}       ${SHORT_TIME_WAIT}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${HOMEPAGE_BUTTON}    ${SHORT_TIME_WAIT}
    
Navigate To Account Editor Page
    Click If Element Is Visible    ${HOMEPAGE_BUTTON}
    Click If Element Is Visible    ${MENU_ACCOUNT_BUTTON}

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
    
Verify All Info On Account Editor Page Correctly
    [Documentation]    Check all info and data
    
    