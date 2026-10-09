*** Settings ***
Resource    Resources/Login.resource
Test Setup       Open Login Page
Test Teardown    Close All Browsers

*** Test Cases ***

TC01 Open Login Form
    [Tags]    login    smoke
    Element Should Be Visible    id=username
    Element Should Be Visible    id=password

TC02 Valid Login
    [Tags]    login    positive
    Login    ${USERNAME}    ${PASSWORD}
    Page Should Contain    Secure Area

TC03 Invalid Username
    [Tags]    login    negative
    Login    wronguser    ${PASSWORD}
    Page Should Contain    Your username is invalid!

TC04 Invalid Password
    [Tags]    login    negative
    Login    ${USERNAME}    wrongpassword
    Page Should Contain     Your password is invalid!

TC05 Valid Login username empty
    [Tags]    login    negative    boundary
    Login    ${EMPTY}    ${PASSWORD}
    Page Should Contain     Your username is invalid!

TC06 Valid Login password empty
    [Tags]    login    negative    boundary
    Login    ${USERNAME}    ${EMPTY}
    Page Should Contain     Your password is invalid!

TC07 Logout
    [Tags]    login    logout
    Login    ${USERNAME}    ${PASSWORD}
    Logout
    Page Should Contain     You logged out of the secure area!
