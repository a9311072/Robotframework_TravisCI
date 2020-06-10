*** Settings ***
Library  SeleniumLibrary
Library  XvfbRobot

*** Settings ***
Resource			200_base.robot


*** Test Cases ***
SampleTest
	openbrowser     1200    800
