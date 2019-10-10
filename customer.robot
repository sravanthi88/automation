*** Settings ***
Library           SeleniumLibrary
Library         Collections
Library         String
Resource    ../testcases/test1.robot

*** Variables ***
${url}            http://qa.icc.salusfin.com
${customer}       test
${site}           //a[@title="Click to get Devices"]       #r16set ()
${device}         //a[@title="Click to edit"]

*** Test Cases ***
customer
    Open Browser    ${url}    Chrome
    set selenium speed       0.1
    Maximize Browser Window
    Click Element    //a[contains(text(),'Login')]
    enter id password       contact@epireum.com     welcome123
    wait until page contains     Customer
    Click link      Customer
    Open Customer site
    Verify sites page contains customer name
    Create site for new customer
    Verify sites page contains new site
    Verify new site contains same site name
    Create new device for new customer
    Verify device page contains new device


*** Keywords ***
Open Customer site
    click link      ${customer}
Verify sites page contains customer name
    wait until page contains    Sites [Customer: ${customer}]
    ${customername}=     Get Text        css=[class="page-header"]
    log     ${customername}
    Should Be Equal As Strings      Sites [Customer: ${customer}]      ${customername}
Create site for new customer
    Wait until page contains        Add Site
    Click Button     Add Site
    ${site}    Generate Random String     length=6    chars=[LETTERS][NUMBERS]
    Log     ${site}
    Input Text      name=siteName      ${site}
    wait until page contains    Save
    Click Button     Save

Create new device for new customer
    wait until page contains     Add Device
    click button    Add Device
    ${device}    Generate Random String     length=6    chars=[LETTERS][NUMBERS]
    Log     ${device}
    Input Text      name=deviceName      ${device}
    wait until page contains    Save
    Click Button     Save






