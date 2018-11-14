*** Settings ***
Library    ExtendedSelenium2Library
Resource    General_Keywords.robot
*** Variables ***
#URL
${HOME_PAGE_URL}      https://gamevui.vn/

#Xpath
${CLOSE_AD_BUTTON}          //a[normalize-space()='Đóng X']

${HOME_PAGE_TITLE}          //a[normalize-space()='Trang chủ']
${USERNAME_LABLE}           //span[@class='user-name']
${USERNAME_BUTTON}          //a[@class='nav-use']
${LOGOUT_BUTTON}            //a[@class='nav-out']
${ALL_CATEGORY_BUTTON}      //a[normalize-space()='Danh mục']
${ALL_CATEGORY_LINK}        //ul[@class='navigation']//a
${CATEGORY_GAME_LINK}       //a[contains(@title,'Game') and contains(normalize-space(),'$$')]

${CATEGORY_PAGE_HEADING}    //h1[@class='heading' and contains(normalize-space(),'$$')]
*** Keywords ***
Goto Home Page
    Go To    ${HOME_PAGE_URL}
    Wait Until Element Is Visible    ${HOME_PAGE_TITLE}    ${SHORT_TIME_WAIT}

Click Close Ad Button
    Wait Until Page Contains Element    ${CLOSE_AD_BUTTON}    ${SHORT_TIME_WAIT}
    Click Element    ${CLOSE_AD_BUTTON}
    
Verify Username Display On Home Page
    Wait Until Element Is Visible    ${USERNAME_LABLE}    ${MEDIUM_TIME_WAIT}
    
Verify All Category Of Game Display When Hover To Category Button
    [Documentation]    Make Sure all category display on page after move mouse to all category button
    [Arguments]    ${number_cate}
    
    Comment    Hover To All Category Button
    Wait Until Element Is Visible    ${ALL_CATEGORY_BUTTON}    ${SHORT_TIME_WAIT}
    Mouse Over    ${ALL_CATEGORY_BUTTON}
    
    Comment    Verify All Category Link Display on Page
    ${list_element}=    Get Webelements    ${ALL_CATEGORY_LINK}
    :FOR    ${element}    IN    @{list_element}
    \    Element Should Be Visible    ${element}
    
    Comment    Verify Number Of Category Is Correctly
    ${list_item}=    Get Length    ${list_element}
    Should Be Equal As Integers    ${list_item}    ${number_cate}    
    
Select Category Game
    [Documentation]    Select Category with given name
    [Arguments]    ${category_name}
    
    Wait Until Element Is Visible    ${ALL_CATEGORY_BUTTON}    ${SHORT_TIME_WAIT}
    Mouse Over    ${ALL_CATEGORY_BUTTON}
    ${category_locator}=    Replace String With Given Text    ${CATEGORY_GAME_LINK}    ${category_name}
    Click If Element Is Visible    ${category_locator}    
    
Verify That Category Page Loaded Successfully
    [Documentation]    Verify Category page load with correct header
    [Arguments]    ${category_name}
    
    ${category_page_header}=    Replace String With Given Text    ${CATEGORY_PAGE_HEADING}    ${category_name}
    Wait Until Element Is Visible    ${category_page_header}    ${MEDIUM_TIME_WAIT}
    
Go To Profile Page
    [Documentation]    Navigate To Profile Page
    Wait Until Element Is Visible    ${USERNAME_LABLE}    ${SHORT_TIME_WAIT}
    Mouse Over    ${USERNAME_LABLE}
    Click If Element Is Visible    ${USERNAME_BUTTON}
    
    