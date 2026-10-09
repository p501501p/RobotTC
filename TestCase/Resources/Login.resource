*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://the-internet.herokuapp.com/login
${BROWSER}     Chrome
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!

*** Keywords ***
Open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    id=username    10s

Login
    [Arguments]    ${username}    ${password}
    Input Text        id=username    ${username}
    Input Password    id=password    ${password}
    Click Button      css=button[type="submit"]

Logout
    Click Link    css=a[href="/logout"]
