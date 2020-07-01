*** Settings ***
Library  SeleniumLibrary
Library  XvfbRobot

*** Settings ***
Resource			200_base.robot
Test Teardown      	Close All Browsers


*** Variables ***
${schedule}                     xpath = /html/body/header/div/nav/a[2]
${search_bar}                   name = custom_search
${search_btn}                   id = search
${internet_class_btn}           xpath = //*[@id="ck_1091_1158"]/div[1]
${internet_class1}              xpath = //*[@id="time-C"]/td[5]/div/div[1]
${internet_class2}              xpath = //*[@id="time-D"]/td[5]/div/div[1]
${internet_class3}              xpath = //*[@id="time-G"]/td[2]/div/div[1]
${basketball_class_btn}         xpath = //*[@id="ck_1091_8301"]/div[1]
${basketball_class1}            xpath = //*[@id="time-E"]/td[3]/div/div[1]
${basketball_class2}            xpath = //*[@id="time-F"]/td[3]/div/div[1]
${selected_btn}                 id = has-select-btn
${remove_basketball}            xpath = //*[@id="ck_1091_8301"]/div[1]
${basketball_empty_class1}      xpath = //*[@id="time-E"]/td[3]
${basketball_empty_class2}      xpath = //*[@id="time-F"]/td[3]
${empty_class}                  ""

*** Test Cases ***
NCTU Plus Schedule
    #Open Browser                    ${host}     ${BROWSER}
    openBrowser                     1200   800
    Maximize Browser Window
    Open Course Schedule
    Search And Select The Course
    Remove Course


*** Keywords ***
Open Course Schedule
    click   ${schedule}


Search And Select The Course
    type                    ${search_bar}               程式
    click                   ${search_btn}         
    click                   ${internet_class_btn}
    verify class            ${internet_class1}          '網路程式設計概論'
    verify class            ${internet_class2}          '網路程式設計概論'
    verify class            ${internet_class3}          '網路程式設計概論'
    Clear Element Text      ${search_bar}
    type                    ${search_bar}               籃球
    click                   ${search_btn}        
    click                   ${basketball_class_btn}
    verify class            ${basketball_class1}        '體育－籃球甲'
    verify class            ${basketball_class2}        '體育－籃球甲'
    Clear Element Text      ${search_bar}


Select Conflict Course
    type                    ${search_bar}           軟體
    click                   ${search_button}        
    click                   ${software_course}
    verify                  ${error_message}

Remove Course
    click                   ${selected_btn}
    click                   ${remove_basketball}
    verify empty class      ${basketball_empty_class1}         ${empty_class}
    verify empty class      ${basketball_empty_class2}         ${empty_class}

verify class
    [Arguments]             ${value}     ${course_name}
    ${Type}=                Get Text                            ${value}
    Run Keyword If          "${Type}" == ${course_name}         Log To Console      Verify Class ${Type} "ok"

verify empty class
    [Arguments]             ${value}     ${course_name}
    ${Type}=                Get Text                            ${value}
    Run Keyword If          "${Type}" == ${course_name}         Log To Console          Verify Empty Class ${Type} "ok"
