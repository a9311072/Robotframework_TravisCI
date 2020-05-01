*** Settings ***
Library  SeleniumLibrary
Library  String
Library  XvfbRobot

*** Variables ***
${BROWSER}   		chrome
${SELSPEED}  		1s
${host}      		https://www.google.com
${TMP_PATH}      	/tmp
${wait_time}     	15s


*** Keywords ***
Open Chrome Browser
    Start Virtual Display    1200    800
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}

openbrowser
    # Open Browser  ${host}  ${BROWSER}
    # Open Browser   ${host}   headlesschrome
	[Arguments]    ${width}    ${height}
	Open Chrome Browser
	Set Window Size    ${width}    ${height}
	GoTo    ${host}

hover
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}     ${wait_time} 
    Mouse Over     ${element}
    sleep          0.5s

open
    [Arguments]    ${element}
    Go To          ${element}

verify
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}     ${wait_time} 

click
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}     ${wait_time} 
    Click Element  ${element}
    sleep    0.3s
    # Run Keyword And Ignore Error  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Wait Until Element Is Visible    ${element}     ${wait_time} 
    Input Text     ${element}    ${value}

resize
	[Arguments]         ${width}    ${height}
	Set Window Size     ${width}    ${height}
	
# getText
#     [Arguments]    ${element}
#     Wait Until Element Is Visible    ${element}     ${wait_time} 
#     ${result} =    Get Text    ${element}
#     # Log To Console    ${result} 
#     [Return]   ${result}

select
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

waitForValue
    [Arguments]                     ${element}  ${value}
    Wait Until Element Is Visible   ${element}  ${g_timeout} 
    Element Should Contain          ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

