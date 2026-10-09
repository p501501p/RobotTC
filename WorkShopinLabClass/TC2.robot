*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC02 Login With Valid Account
    Open Browser    https://the-internet.herokuapp.com/login    Chrome
    Input Text    id=username    tomsmith
    Input Password    id=password    SuperSecretPassword!
    Click Button    css=button[type="submit"]
    Page Should Contain  Secure Area
    Close Browser
