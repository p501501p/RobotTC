*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://the-internet.herokuapp.com/login
${BROWSER}     chrome
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!

*** Test Cases ***
Valid Login
    Open Browser    ${URL}    ${BROWSER}
    Login    ${USERNAME}    ${PASSWORD}
    Page Should Contain    Secure Area
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text        id=username    ${username}
    Input Password    id=password    ${password}
    Click Button      css=button[type="submit"]
