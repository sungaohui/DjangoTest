*** Settings ***
Library           RequestsLibrary
Library           SeleniumLibrary

*** Variables ***
${demo_url}       http://myblog.demo/blog/index

*** Test Cases ***
api
    [Tags]  critical
    Create Session    api    ${demo_url}
    ${alarm_system_info}    RequestsLibrary.Get Request    api    /
    log    ${alarm_system_info.status_code}
    log    ${alarm_system_info.content}
    should be true    ${alarm_system_info.status_code} == 200

ui
    [Tags]  critical
    open browser    ${demo_url}/    headlesschrome    None    False    None    None add_argument("--no-sandbox")
    sleep    2s
    Page Should Contain    blog!
    close browser
