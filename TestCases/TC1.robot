*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://parabank.parasoft.com/parabank/index.htm
${BROWSER}    chrome
${TXT_USERNAME}      name=username
${USERNAME}   john
${TXT_PASSWORD}      name=password
${PASSWORD}    demo
${BTN_LOGIN}         css=input[value="Log In"]
${SUCCESS_TEXT}      Accounts Overview

*** Test Cases ***
LoginTest with valid credentials
    Open Browser To Login Page
    Input Text        ${TXT_USERNAME}    ${USERNAME}
    Input Password    ${TXT_PASSWORD}    ${PASSWORD}
    Click Button      ${BTN_LOGIN}
    Page Should Contain    ${SUCCESS_TEXT}
    Capture Page Screenshot
    [Teardown]    Close Browser


*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    ${headless}=    Set Variable    --headless=new
    ${nosandbox}=    Set Variable    --no-sandbox
    ${disabledev}=    Set Variable    --disable-dev-shm-usage

    Call Method    ${options}    add_argument    ${headless}
    Call Method    ${options}    add_argument    ${nosandbox}
    Call Method    ${options}    add_argument    ${disabledev}

    Open Browser
    ...    ${URL}
    ...    ${BROWSER}
    ...    options=${options}

    Maximize Browser Window





