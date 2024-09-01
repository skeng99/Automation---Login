*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource     ../Resources/keywords.robot
Library      AutoRecorder  mode=suite


*** Test Cases ***
Valid Login with correct credentials
    Open Browser To Login Page
    Wait Until Page Contains    Customer Login
    Input UserName     ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Successful Login message
    [Teardown]    Close Browser