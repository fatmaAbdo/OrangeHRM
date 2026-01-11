*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   Variables.robot

*** Keywords ***

# ---------- Browser Actions ----------
Open App
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close App
    Close Browser

# ---------- Loader / Wait ----------
Wait For Loader To Disappear
    Wait Until Element Is Not Visible    css:.oxd-form-loader    10

Wait Until Field Has Value
    [Arguments]    ${locator}    ${expected}    ${timeout}=10
    Wait Until Keyword Succeeds    ${timeout}    1s
    ...    Run Keyword And Ignore Error
    ...    Textfield Value Should Be    ${locator}    ${expected}

Should See Page Title
    [Arguments]    ${LOCATOR}    ${EXPECTED_TEXT}    ${TIMEOUT}=10
    Wait Until Element Is Visible    ${LOCATOR}    ${TIMEOUT}
    ${ACTUAL_TEXT}=    Get Text    ${LOCATOR}
    Should Be Equal    ${ACTUAL_TEXT}    ${EXPECTED_TEXT}

# ---------- Buttons ----------
Click Button By Text
    [Arguments]    ${BUTTON_NAME}    ${TIMEOUT}=10
    Wait Until Element Is Visible    xpath=//button[normalize-space()='${BUTTON_NAME}']    ${TIMEOUT}
    Click Element                   xpath=//button[normalize-space()='${BUTTON_NAME}']

# ---------- Dropdown / Listbox ----------
Select From Listbox
    [Arguments]    ${OPTION_TEXT}    ${TIMEOUT}=10
    Wait Until Element Is Visible    xpath=//div[@role='option' and normalize-space()='${OPTION_TEXT}']    ${TIMEOUT}
    Click Element    xpath=//div[@role='option' and normalize-space()='${OPTION_TEXT}']

# ---------- Table / Search ----------
Verify Table Contains
    [Arguments]    ${TEXT}    ${TIMEOUT}=10
    Wait Until Element Is Visible    xpath=//div[@class='oxd-table-card']//div[normalize-space()='${TEXT}']    ${TIMEOUT}
    Element Should Be Visible        xpath=//div[@class='oxd-table-card']//div[normalize-space()='${TEXT}']

# ---------- Generic Utils ----------
Generate Unique Username
    ${RANDOM}=     Generate Random String    5    [LETTERS][NUMBERS]
    ${USERNAME}=   Set Variable    ${USERNAME_PREFIX}${RANDOM}
    RETURN      ${USERNAME}
