*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://demo.nopcommerce.com/
${BROWSER}    chrome
${USERNAME}    testuser
${PASSWORD}    testpass

*** Test Cases ***
LoginTest with valid credentials
    Open Browser To Login Page
#    Input Text    id=username    ${USERNAME}
#    Input Text    id=password    ${PASSWORD}
#    Click Button    id=login-button
#    Page Should Contain    Welcome
    [Teardown]    Close Browser

#Invalid Email Should Show Error
#    Input Text    id=email    invalidemail
#    Input Text    id=password    ${PASSWORD}
#    Click Button    id=login-button
#    Page Should Contain    Invalid email address
#
#Valid Email Should Proceed
#    Input Text    id=email    user@example.com
#    Input Text    id=password    ${PASSWORD}
#    Click Button    id=login-button
#    Page Should Contain    Thank you

*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${arg1}=       Set Variable    --headless=new
    ${arg2}=       Set Variable    --no-sandbox
    ${arg3}=       Set Variable    --disable-dev-shm-usage
    ${arg4}=       Set Variable    --user-data-dir=/tmp/chrome-profile

    Call Method    ${options}    add_argument    ${arg1}
    Call Method    ${options}    add_argument    ${arg2}
    Call Method    ${options}    add_argument    ${arg3}
    Call Method    ${options}    add_argument    ${arg4}

    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window










