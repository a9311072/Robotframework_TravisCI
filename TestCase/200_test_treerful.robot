*** Settings ***
Library  SeleniumLibrary
Library  XvfbRobot

*** Settings ***
Resource			200_base_treerful.robot

*** Variables ***
${btn_booking}	      class=booking-submit
${btn_search_window}      class=search-window

*** Test Cases ***
SampleTest
	openbrowser     1920    1080
	${res} =	Get Title
	Log To Console 	${res}
	click   ${btn_booking}

BtnWindowTest
	Wait Until Element Is Visible	${btn_search_window}
	${res} =	Get Title
	Log To Console 	${res}
	${res} = 	Get Text	${btn_search_window}
	Log To Console	${res}
	${res} = 	Get Value	xpath=//input[@name='window']
	Should Be Equal	${res}	0	
	Log To Console	${res}
ClickBtnWindow
	click	${btn_search_window}
	${res} = 	Get Value	xpath=//input[@name='window']
	Should Be Equal	${res}	1
	Log To Console	${res}

CloseTest
	close Browser
