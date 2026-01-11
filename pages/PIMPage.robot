*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/Variables.robot
Resource   ../resources/Common.robot
Resource   ../resources/TestData.robot

*** Variables ***
${ADD_BUTTON}       Add
${SUBMIT_BUTTON}    xpath=//button[@type='submit']

*** Keywords ***

Navigate To PIM Page
    Wait For Loader To Disappear
    Wait Until Element Is Visible    xpath=//a[@href='/web/index.php/pim/viewPimModule']    10
    Click Element    xpath=//a[@href='/web/index.php/pim/viewPimModule']
    Should See Page Title    xpath=//h6[text()='PIM']    PIM

Add Employee
    [Arguments]    ${FIRST_NAME}  ${MIDDLE_NAME}  ${LAST_NAME}
    Click Button By Text    ${ADD_BUTTON}
    Wait Until Element Is Visible    name=firstName    10
    Input Text    name=firstName    ${FIRST_NAME}
    Input Text    name=middleName   ${MIDDLE_NAME}
    Input Text    name=lastName     ${LAST_NAME}
    Wait For Loader To Disappear

    Wait Until Element Is Visible    xpath=//span[contains(@class,'oxd-switch-input')]    10
    Click Element    xpath=//span[contains(@class,'oxd-switch-input')]

    ${USERNAME}=   Generate Unique Username
    Input Text     xpath=(//label[normalize-space()='Username']/following::input[contains(@class,'oxd-input')])[1]    ${USERNAME}
    Input Text     xpath=//label[normalize-space()='Password']/following::input[@type='password']     Password123!
    Input Text     xpath=//label[normalize-space()='Confirm Password']/following::input[@type='password']     Password123!

    Click Button By Text    Save
    Should See Page Title    xpath=//h6[text()='Personal Details']    Personal Details

Verify Employee Added
    [Arguments]    ${FIRST_NAME}  ${LAST_NAME}
    ${full_name}=    Set Variable    ${FIRST_NAME} ${LAST_NAME}
    Wait Until Element Is Visible     xpath=//h6[text()='${full_name}']   10 
    Element Should Be Visible         xpath=//h6[text()='${full_name}']

Search Employee
    [Arguments]    ${FULL_NAME}
    Wait For Loader To Disappear
    ${EMP_INPUT}=      Set Variable    xpath=(//input[@placeholder='Type for hints...'])[1]
    Wait Until Element Is Visible    ${EMP_INPUT}    10
    Clear Element Text               ${EMP_INPUT}
    Input Text                       ${EMP_INPUT}    ${FULL_NAME}
    Select From Listbox              ${FULL_NAME}
    Click Element                    ${SUBMIT_BUTTON}
    Wait For Loader To Disappear

Verify Employee Data
    [Arguments]    ${FIRST_NAME}  ${LAST_NAME}  ${FIRST_MIDDLE}
    Wait For Loader To Disappear
    Verify Table Contains    ${FIRST_MIDDLE}
    Click Element    xpath=//div[@class='oxd-table-card']//div[normalize-space()='${FIRST_MIDDLE}']
    Wait For Loader To Disappear
    Should See Page Title    xpath=//h6[text()='Personal Details']    Personal Details
    Wait Until Field Has Value    name=firstName     ${FIRST_NAME}
    Wait Until Field Has Value    name=lastName      ${LAST_NAME}
