*** Settings ***
Library  SeleniumLibrary
Library  XvfbRobot

*** Settings ***
Resource			    200_base.robot
Test Teardown      	    Close All Browsers


*** Variables ***
# ${host}                         http://corsimulate.nctu.me/
${schedule_page}                xpath = //*[@id="nav"]/a[2]
${login_page}                   xpath = //*[@id="nav"]/a[3]
${username}                     id= username
${password}                     id= password
${submit_btn}                   id= btn-submit
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
${remove_internet_btn}          xpath = //*[@id="ck_1091_1158"]/div[1]
${internet_empty1}              xpath = //*[@id="time-C"]/td[5]
${internet_empty2}              xpath = //*[@id="time-D"]/td[5]
${internet_empty3}              xpath = //*[@id="time-G"]/td[2]
${remove_basketball_btn}        xpath = //*[@id="ck_1091_8301"]/div[1]
${basketball_empty1}            xpath = //*[@id="time-E"]/td[3]
${basketball_empty2}            xpath = //*[@id="time-F"]/td[3]
${empty_class}                  ""
${labview_class_btn}            xpath = //*[@id="ck_1091_1144"]/div[1]
${conflict_class_msg}           xpath = //*[@id="pop"]/div/div/div[2]
${conflict_class_btn}           id= pop-btn
${logout_btn}                   xpath = //*[@id="nav"]/a[4]

*** Test Cases ***
NCTU Plus Add Courses to Schedule
    Open NCTU Plus
    Add Course

NCTU Plus Add Conflict Course to Schedule
    Open NCTU Plus
    Add Conflict Course

NCTU Plus Remove Course from Schedule
    Open NCTU Plus
    Remove Course
    click                       ${logout_btn}


*** Keywords ***
Open NCTU Plus
    Open Browser                ${host}     ${BROWSER}
    Maximize Browser Window
    click                       ${login_page}
    sleep                       1s
    verify                      ${username}
    type                        ${username}             test
    sleep                       0.5s
    type                        ${password}             test
    click                       ${submit_btn}
    click                       ${schedule_page}

Add Course
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


Add Conflict Course
    type                    ${search_bar}               程式
    click                   ${search_btn}         
    click                   ${labview_class_btn}        
    verify conflic class    ${basketball_class1}        "LabVIEW 程式語言"

Remove Course
    click                   ${selected_btn}
    click                   ${remove_basketball_btn}
    verify empty class      ${basketball_empty1}       ${empty_class}       '體育－籃球甲'
    verify empty class      ${basketball_empty2}       ${empty_class}       '體育－籃球甲'
    click                   ${remove_internet_btn}
    verify empty class      ${internet_empty1}         ${empty_class}       '網路程式設計概論'
    verify empty class      ${internet_empty2}         ${empty_class}       '網路程式設計概論'
    verify empty class      ${internet_empty3}         ${empty_class}       '網路程式設計概論'


verify class
    [Arguments]             ${value}     ${course_name}
    ${Type}=                Get Text                            ${value}
    Run Keyword If          "${Type}" == ${course_name}         Log To Console      Verify Class ${Type} "ok"

verify empty class
    [Arguments]             ${value}     ${course_name}         ${removed_course}
    ${Type}=                Get Text                            ${value}
    Run Keyword If          "${Type}" == ${course_name}         Log To Console      Verify Removed Class ${removed_course} "ok"

verify conflic class
    [Arguments]             ${value}     ${course_name}
    ${Type}=                Get Text                            ${value}
    Run Keyword If          "${Type}" != ${course_name}         Log To Console      ${course_name} conflict with ${Type}. The course is not added.
    ...  ELSE               Log To Console                      verify conflict course error
