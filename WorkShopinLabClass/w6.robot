*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Login Page
Test Teardown     Close Browser

*** Variables ***
${URL}        https://the-internet.herokuapp.com/login
${BROWSER}    Edge

*** Test Cases ***
TC01 Valid Login
    Login    tomsmith    SuperSecretPassword!
    Page Should Contain    Secure Area

TC02 Invalid Username
    Login    wronguser    SuperSecretPassword!
    Page Should Contain    Your username is invalid
