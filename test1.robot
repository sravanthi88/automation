*** Settings ***
Library           SeleniumLibrary
Library         Collections
Library         String
Library     ../externalkeywords/userkeywords.py

#*** Variables ***
#${url}            http://qa.icc.salusfin.com


*** Keywords ***
enter id password
    [Arguments]    ${username}    ${password}
    [Documentation]    This keyword is to give username and password
    Input Text    id = signupusername    ${username}    #contact@epireum.com
    Input Text    id = signupPassword    ${password}    #welcome123
    Click Element    id = signupSubmit

Verify sites page contains new site
    wait until page contains     Customer
    Click link      Customer
    click link      ${customer}
    Wait until page contains element       ${site}
    Element Should Be Enabled     ${site}
Verify new site contains same site name
    Click link      ${site}
    ${sitename}=    Get Text        css=[class="page-header"]
    log     ${sitename]
    Should Be Equal       Devices [Site: r16set]       ${sitename}
Verify device page contains new device
    wait until page contains        Sites
    Click link      Sites
    Wait until page contains element      ${site}
    Click link     ${site}
    Wait until page contains element        ${device}    #//a[@title="Click to edit"]
    Element Should Be Enabled     ${device}    #//a[@title="Click to edit"]






verify page contains customer elements
    Page Should Contain    New Customer
    Page Should Contain    Name
    Page Should Contain    Email
    Page Should Contain    Password
    Page Should Contain Button    css=[type="submit"]

verify customer textfields
    Page Should Contain Textfield    id=custName    message= error
    Input Text    id=custName    Sravanthi
    Page Should Contain Textfield    id=custEmail
    Input Text    id=custEmail    sudha.sravanthi88@gmail.com
    Page Should Contain Textfield    id=custPwd
    Input Text    id=custPwd    Sahasra

verify Enable login credentials
    Element Should Be Enabled    id = signupusername
    Element Should Be Enabled    id=signupPassword

verify customerslist
   wait until page contains    Create Customer
    ${customer}       Get Text    css=[class="flex-container"]
    Log    ${customer}
    ${list2}=   Split String    ${customer}
    log     ${list2}
create folder at runtime
    [arguments]    ${folder}  ${subfolder}
    create_folder       ${folder}
    sub_folder          ${subfolder}