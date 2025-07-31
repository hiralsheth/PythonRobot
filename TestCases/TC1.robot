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

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

