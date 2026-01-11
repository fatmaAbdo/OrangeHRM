*** Settings ***
Resource   ../resources/Common.robot
Resource   ../resources/Variables.robot
Resource   ../resources/TestData.robot

*** Keywords ***
Navigate To Recruitment
    Wait For Loader To Disappear
    Click Element    xpath=//a[@href='/web/index.php/recruitment/viewRecruitmentModule']
    Should See Page Title    xpath=//h6[text()='Recruitment']    Recruitment

Create Vacancy
    [Arguments]  ${JOB_TITLE}  ${SEARCH_HINT}  ${HIRING_MANAGER}
    Click Element    xpath=//a[text()='Vacancies']
    Wait For Loader To Disappear
    Click Button By Text  Add
    Wait Until Element Is Visible    xpath=(//label[normalize-space()='Vacancy Name']/following::input[contains(@class,'oxd-input')])[1]    10
    ${TIMESTAMP}=    Get Time    epoch
    ${VACANCY_NAME}=    Set Variable    Automation_Vacancy_${TIMESTAMP}
    Input Text     xpath=(//label[normalize-space()='Vacancy Name']/following::input[contains(@class,'oxd-input')])[1]    ${VACANCY_NAME}
    Click Element    xpath=//div[contains(@class,'oxd-select-text') and contains(text(),'-- Select --')]
    Select From Listbox    ${JOB_TITLE}
    Input Text       xpath=//input[@placeholder='Type for hints...']  ${SEARCH_HINT}
    Select From Listbox    ${HIRING_MANAGER}
    Click Button     xpath=//button[@type='submit']
    Wait Until Location Contains    /recruitment/addJobVacancy/    10
    ${CURRENT_URL}=    Get Location
    Should Match Regexp    ${CURRENT_URL}    .*/recruitment/addJobVacancy/\\d+$

Add Candidate
    [Arguments]  ${FIRST_NAME}  ${LAST_NAME}  ${EMAIL}
    Click Element    xpath=//a[text()='Candidates']
    Wait For Loader To Disappear
    Click Button By Text  Add
    Wait For Loader To Disappear
    Wait Until Element Is Visible    xpath=//h6[text()='Add Candidate']    10
    Input Text       name=firstName    ${FIRST_NAME}
    Input Text       name=lastName     ${LAST_NAME}
    Input Text       xpath=//input[@placeholder='Type here']    ${EMAIL}

    Click Button     xpath=//button[@type='submit']
    Should See Page Title  xpath=//h6[text()='Candidate Profile']  Candidate Profile
