*** Settings ***
Documentation     A test suite with a single test for Register.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource     ../Resources/keywords.robot
Library      AutoRecorder  mode=suite
Suite Teardown    Close Browser

*** Test Cases ***
Valid Register
    Open Browser To Login Page
    Login Page Should Be Open
    Select Register link
    Fill the form with random data
    Select Register button
    Click logout
    Wait Until Page Contains    Customer Login
    Input UserName     ${user_name}
    Input Password     ${password}
    Submit Credentials
    Successful Login message
    Sleep    5s

