*** Settings ***
Documentation    A resource file with reusable keywords from login page

Keyword Tags    login-keywords

Resource    ../pages/login_page.resource


*** Keywords ***
Login In To The Application
    Open Browser To Login Page
    Input Username
    Input Password
    Submit Credentials

Logout From The Application
    Logout Application
