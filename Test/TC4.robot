*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://the-internet.herokuapp.com/login
${BROWSER}     Edge
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!

*** Test Cases ***
TC01 Valid Login
    Open Browser    ${URL}    ${BROWSER}
    Login    ${USERNAME}    ${PASSWORD}
    Page Should Contain    Secure Area
    Close Browser
TC02 Invalid Username
    Open Browser    ${URL}    ${BROWSER}
    Login    wronguser    SuperSecretPassword!
    Page Should Contain    Your username is invalid 
      Close Browser

TC03 Invalid Password 
        Open Browser    ${URL}    ${BROWSER}
        Login    tomsmith    wrongpassword
    Page Should Contain    Your password is invalid
      Close Browser
*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text        id=username    ${username}
    Input Password    id=password    ${password}
    Click Button      css=button[type="submit"]
