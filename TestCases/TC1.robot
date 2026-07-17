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
   # ${arg1}=       Set Variable    --headless=new
    ${arg2}=       Set Variable    --no-sandbox
    ${arg3}=       Set Variable    --disable-dev-shm-usage
  #  ${arg4}=       Set Variable    --user-data-dir=/tmp/chrome-profile

   # Call Method    ${options}    add_argument    ${arg1}
    Call Method    ${options}    add_argument    ${arg2}
    Call Method    ${options}    add_argument    ${arg3}
 #   Call Method    ${options}    add_argument    ${arg4}

    Create WebDriver    Chrome    options=${options}
    Delete All Cookies
    Go To    ${URL}
    Maximize Browser Window










