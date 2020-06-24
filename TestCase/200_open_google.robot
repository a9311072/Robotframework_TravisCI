*** Settings ***
Library  SeleniumLibrary
Library  XvfbRobot

*** Settings ***
Resource			200_base.robot

*** Variables ***
${query_context}      name=q
${query_button}	      name=btnK

*** Test Cases ***
SampleTest
	openbrowser     1200    800
	type    ${query_context}         nctu
	click   ${query_button}
