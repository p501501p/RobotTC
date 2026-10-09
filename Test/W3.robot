*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://the-internet.herokuapp.com/login
${BROWSER}     Edge
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!

*** Test Cases ***
Login With Valid Account
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=username    ${USERNAME}
    Input Password    id=password    ${PASSWORD}
    Click Button    css=button[type="submit"]
    Page Should Contain    Secure Area
    Close Browser
