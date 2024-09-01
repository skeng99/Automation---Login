
*** Settings ***
Library     SeleniumLibrary
Resource     ../Resources/keywords.robot
Library      AutoRecorder  mode=suite

Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail




*** Test Cases ***               USER NAME        PASSWORD
Empty Username                  ${EMPTY}         Prashant Nepal
Empty Password                 Prashant Nepal        ${EMPTY}
Empty Username And Password    ${EMPTY}          ${EMPTY}
Invalid Username                invalid_username           Test@12345
Invalid Password                Prashant Nepal           invalid_password


*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input UserName    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

*** Keywords ***
Login Should Have Failed
   Wait until page contains    Error!   10s
   Page should contain element    xpath://p[@class='error']