*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Test Cases ***
TC01 Open Login Form
    Open Browser    https://the-internet.herokuapp.com/login    Edge
    Wait Until Element Is Visible    id=username    10s
    Element Should Be Visible    id=password
