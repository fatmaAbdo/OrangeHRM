*** Settings ***
Resource    ../resources/Common.robot
Resource    ../pages/LoginPage.robot
Resource    ../pages/PIMPage.robot
Test Setup  Open App
Test Teardown  Close App
*** Test Cases ***
Create Employee Test
    [Tags]    smoke
    Login    ${ADMIN}    ${PASS}
    Verify Login Successful
    Navigate To PIM Page
    Add Employee   ${FIRST_NAME}  ${MIDDLE_NAME}  ${LAST_NAME}
    Verify Employee Added    ${FIRST_NAME}  ${LAST_NAME}

Search Employee Test
    [Tags]    regression
    Login    ${ADMIN}    ${PASS}
    Verify Login Successful
    Navigate To PIM Page
    Search Employee   ${FULL_NAME}  
    Verify Employee Data  ${FIRST_NAME}  ${LAST_NAME}  ${FIRST_MIDDLE}

 
