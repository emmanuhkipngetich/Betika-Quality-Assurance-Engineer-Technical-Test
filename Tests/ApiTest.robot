*** Settings ***

Library  RequestsLibrary

*** Test Cases ***
Test API Endpoint
    [Tags]    api
    Create Session    users_api    https://fakerestapi.azurewebsites.net
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}=    GET On Session    users_api  /api/v1/Users    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}  Set Variable   ${response.json()}
    ${response_string}  Convert To String    ${response_body}
    Should Contain    ${response_string}  User 6
    ${count}=    Get Length    ${response_body}
    Log    Number of objects in response: ${count}