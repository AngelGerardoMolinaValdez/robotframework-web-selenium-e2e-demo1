*** Settings ***
Documentation     A reusable keywords that can be used to login to the application

Keyword Tags      common

Resource    ${EXECDIR}/config/global/dependencies/pages.resource


*** Keywords ***
Select Account Service
    [Arguments]    ${service_name}
    Highlight Element Async    link:${service_name}
    Add Step Capture    Seleccione el servicio "${service_name}"    INFO
    Click Link    ${service_name}
    Wait Until Page Contains Element   css:h1.title    10s
