*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/Variables.robot
Resource   ../resources/Common.robot
Resource   ../resources/TestData.robot

*** Variables ***
${ADD_BUTTON}      Add
${SAVE_BUTTON}     Save
${STATUS_ENABLED}  Enabled

*** Keywords ***

Navigate To Admin Module
    Click Element    xpath=//span[normalize-space()='Admin']
    Wait Until Location Contains    /admin/viewSystemUsers    10s
    Click Button By Text    ${ADD_BUTTON}

Create New System User
    [Arguments]   ${USER_ROLE}   ${SEARCH_HINT}   ${HIRING_MANAGER}   ${NEW_PASSWORD}   ${NEW_USERNAME}
    Wait Until Element Is Visible    xpath=//h6[normalize-space()='Add User']    10s
    Click Element    xpath=//label[normalize-space()='User Role']/following::div[contains(@class,'oxd-select-text')][1]
    Select From Listbox    ${USER_ROLE}

    Input Text    xpath=//input[@placeholder='Type for hints...']    ${SEARCH_HINT}
    Select From Listbox    ${HIRING_MANAGER}

    Click Element    xpath=//label[normalize-space()='Status']/following::div[contains(@class,'oxd-select-text')][1]
    Select From Listbox    ${STATUS_ENABLED}

    Input Text    xpath=//label[normalize-space()='Username']/following::input[1]    ${NEW_USERNAME}
    Input Text    xpath=//label[normalize-space()='Password']/following::input[1]    ${NEW_PASSWORD}
    Input Text    xpath=//label[normalize-space()='Confirm Password']/following::input[1]    ${NEW_PASSWORD}

    Click Button By Text    ${SAVE_BUTTON}
    Wait Until Location Contains    /admin/viewSystemUsers    10
    ${CURRENT_URL}=    Get Location
    Should Match Regexp    ${CURRENT_URL}    .*/admin/viewSystemUsers

Logout
    Wait Until Element Is Visible    xpath=//i[@class='oxd-icon bi-caret-down-fill oxd-userdropdown-icon']    10s
    Click Element    xpath=//i[@class='oxd-icon bi-caret-down-fill oxd-userdropdown-icon']
    Click Element    xpath=//a[normalize-space()='Logout']
    Wait Until Location Contains    /auth/login    10s
