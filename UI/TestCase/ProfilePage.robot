*** Settings ***
Library     ExtendedSelenium2Library
Library     api   
Library     FakerLibrary     
Resource    ../Keyword/LoginPage_Keyword.robot
Resource    ../Keyword/ProfilePage_Keyword.robot
Resource    ../Keyword/HomePage_Keyword.robot
Suite Setup    Run Keywords    Goto Login Page
...                     AND    Log In    ${USER_NAME}    ${PASSWORD}        

*** Test Cases ***
Navigate To User Profile Page Successfully After Login
    [Documentation]    Navigate To this page from Homepage
    Go To Profile Page
    Verify Profile Page Loaded Successfully
        
Verify That User Can Navigate To Account Editor Page Successfully
    [Documentation]    Navigate To Account Editor page And verify all control
    Navigate To Account Editor Page
    Verify Account Editor Page Loaded Successfully
    
Verify Account Info Is Show Correctly When Change By Another User
    [Documentation]    Change All Info Via API and Check On UI
    
    ${account_name}=   Generate Random String    8
    @{list_title}=    Create List    Bạn    Chú    Em    Anh    Ngài    Cậu    Ông    Sir    Thím    Bác
    ${account_title_num}=   Generate Random String    1    chars=[NUMBERS]
    ${account_title_num}=    Convert To Integer    ${account_title_num}
    ${account_location}=   Generate Random String    16
    ${day}=    Set Variable    random.randint(1, 30)
    ${month}=    Set Variable    random.randint(1, 12)
    ${year}=    Set Variable    random.randint(1980, 2000)
    Update Account Info Via Api    ${COOKIE}    @{list_title}[${account_title_num}]   ${account_name}    ${account_location}    ${day}    ${month}    ${year}
    Verify All Info On Account Editor Correctly    ${account_name}    @{list_title}[${account_title_num}]    ${day}    ${month}    ${year}    Nam    ${account_location}