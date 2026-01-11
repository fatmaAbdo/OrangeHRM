*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/Variables.robot

*** Keywords ***
Login
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    name=username    10
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button  xpath=//button[@type='submit']

Verify Login Successful
    Wait Until Element Is Visible    xpath=//span[text()='Dashboard']    10
    Page Should Contain    Dashboard
