*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library    faker_data.py
Variables   ../PageObjects/loginPage_Locators.py
Variables   ../PageObjects/register_Locators.py




*** Variables ***
${BROWSER}        chrome
${LOGIN URL}        https://parabank.parasoft.com/parabank/index.htm
${VALID USER}     Prashant Nepal
${VALID PASSWORD}       Test@12345


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Wait until page contains    Customer Login
    Title Should Be     ParaBank | Welcome | Online Banking

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input UserName
    [Arguments]    ${username}
    Wait Until Page Contains    Customer Login
    Input Text    ${username_locator}   ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${password_locator}    ${password}

Submit Credentials
    Click Element    ${login_button_locator}

Select Register link
    Click element    ${register_link_locator}
    Wait until page contains    Signing up is easy!

Successful Login message
    Wait Until Page Contains    Accounts Overview
    Page should contain    Accounts Overview

Fill the form with random data
    ${first_name}   Generate Random First Name
    Input text    //input[@id='customer.firstName']    ${first_name}
    ${last_name}   Generate Random Last Name
    Input text    //input[@id='customer.lastName']     ${lastname}
    ${address}      Generate Random Address
    Input text    //input[@id='customer.address.street']    ${address}
    ${city}         Generate Random City
    Input text    //input[@id='customer.address.city']        ${city}
    ${state}      Generate Random State
    Input text      //input[@id='customer.address.state']       ${state}
    ${zip_code}      Generate Random Zipcode
    Input text    //input[@id='customer.address.zipCode']       ${zipcode}
    ${phone_number}     Generate Random Phonenumber
    Input text    //input[@id='customer.phoneNumber']       ${phonenumber}
    ${ssn}      Generate Random Ssn
    Input text    //input[@id='customer.ssn']       ${ssn}
    ${user_name}    Generate Random Username
    Input text    //input[@id='customer.username']   ${user_name}
    ${password}     Generate Random Password
    Input text    //input[@id='customer.password']      ${password}
    Input text    //input[@id='repeatedPassword']       ${password}
    Set Test Variable    ${username}
    Set Test Variable    ${password}

Select Register button
     Click Element      ${register_button_locator}
     Wait until page contains    Your account was created successfully. You are now logged in.
     Page should contain    Your account was created successfully. You are now logged in.


Click logout
    Click element    ${logout_locator}



