*** Settings ***
Keyword Tags    bill-payment-page

Resource    ${EXECDIR}/config/global/dependencies/pages.resource


*** Keywords ***
Wait Until Payee Name Is Visible
    Wait Until Element Is Visible    name:payee.name

Input Payee Name
    [Arguments]    ${PAYEE_NAME}
    Highlight Element Persistent    name:payee.name
    Input Text    name:payee.name    ${PAYEE_NAME}

Input Address
    [Arguments]    ${ADDRESS}
    Highlight Element Persistent    name:payee.address.street
    Input Text    name:payee.address.street    ${ADDRESS}

Input City
    [Arguments]    ${CITY}
    Highlight Element Persistent    name:payee.address.city
    Input Text    name:payee.address.city    ${CITY}

Input State
    [Arguments]    ${STATE}
    Highlight Element Persistent    name:payee.address.state
    Input Text    name:payee.address.state    ${STATE}

Input Zip Code
    [Arguments]    ${ZIP_CODE}
    Highlight Element Persistent    name:payee.address.zipCode
    Input Text    name:payee.address.zipCode    ${ZIP_CODE}

Input Phone
    [Arguments]    ${PHONE}
    Highlight Element Persistent    name:payee.phoneNumber
    Input Text    name:payee.phoneNumber    ${PHONE}

Input Account
    [Arguments]    ${ACCOUNT}
    Highlight Element Persistent    name:payee.accountNumber
    Input Text    name:payee.accountNumber    ${ACCOUNT}

Input Verify Account
    [Arguments]    ${VERIFY_ACCOUNT}
    Highlight Element Persistent    name:verifyAccount
    Input Text    name:verifyAccount    ${VERIFY_ACCOUNT}

Input Amount
    [Arguments]    ${AMOUNT}
    Highlight Element Persistent    name:amount
    Input Text    name:amount    ${AMOUNT}

Select Account
    [Arguments]    ${FROM_ACCOUNT}
    Highlight Element Persistent    name:fromAccountId
    Select From List By Value    name:fromAccountId    ${FROM_ACCOUNT}

Send Payment
    Highlight Element Persistent    css:input[value\="Send Payment"]
    Add Step Capture    Formulario de pago    INFO
    Click Element    css:input[value="Send Payment"]

Verify Payment
    [Arguments]    ${MESSAGE}
    Wait Until Element Is Visible    css:div[ng-show="showResult"]
    Highlight Element Persistent    css:div[ng-show\="showResult"]
    Element Text Should Be    xpath://div[@ng-show="showResult"]//descendant::h1    ${MESSAGE}
    Add Step Capture    Pago exitoso    PASS
