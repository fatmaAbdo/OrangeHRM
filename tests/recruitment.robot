*** Settings ***
Resource   ../pages/LoginPage.robot
Resource   ../pages/RecruitmentPage.robot
Test Setup  Open App
Test Teardown  Close App
*** Test Cases ***
Create Vacancy - Smoke
    [Tags]    smoke
    Login    ${ADMIN}    ${PASS}
    Verify Login Successful
    Navigate To Recruitment
    Create Vacancy  ${JOB_TITLE}  ${SEARCH_HINT}  ${HIRING_MANAGER}

Add Candidate - Regression
    [Tags]    regression
    Login    ${ADMIN}    ${PASS}
    Verify Login Successful
    Navigate To Recruitment
    Add Candidate  ${FIRST_NAME}  ${LAST_NAME}  ${EMAIL}
