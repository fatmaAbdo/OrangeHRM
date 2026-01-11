*** Settings ***
Resource   ../pages/LoginPage.robot
Resource   ../pages/AdminPage.robot
Test Setup  Open App
Test Teardown  Close App

*** Test Cases ***
Create System User And Login
    [Tags]    smoke
    Login    ${ADMIN}    ${PASS}
    Verify Login Successful
    Navigate To Admin Module
    ${NEW_USERNAME}=   Generate Unique Username
    Create New System User  ${USER_ROLE_ADMIN}   ${SEARCH_HINT}   ${HIRING_MANAGER}   ${NEW_PASSWORD}   ${NEW_USERNAME}
    Logout
    Login    ${NEW_USERNAME}    ${NEW_PASSWORD}
    Verify Login Successful
