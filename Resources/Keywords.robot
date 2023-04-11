*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections


*** Keywords ***
Opening Browser
    Open Browser    https://www.betika.com/en-ke/login    chrome
    Maximize Browser Window

User inputs username
  Wait Until Element Is Visible  //input[@placeholder='e.g. 0712 234567']
  Input Text  //input[@placeholder='e.g. 0712 234567']  254735638271


User inputs password
  Input Text  //input[@type='password']  2020

User clicks login
  Wait Until Element Is Visible  //button[@class='button account__payments__submit session__form__button login button button__secondary']
  Click Element  //button[@class='button account__payments__submit session__form__button login button button__secondary']

User should be logged in successfully
  Wait Until Element Is Visible  //button[@class='button account__payments__submit button button__secondary share-code-button']

User inputs wrong password
  Input Text  //input[@type='password']  Qwerty123!!

User should be notified of incorrect details
  Wait Until Element Is Visible  //p[@class='message']

User selects the lowest odds
    ${my_list}=    Create List
    FOR    ${value}    IN    @{my_list}
        ${locator}=    Set Variable    xpath=//span[normalize-space()='${value}']
        ${element}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
        Run Keyword If    '${element}' == 'True'    Click Element    ${locator}
        Run Keyword If    '${element}' == 'True'    Exit For Loop
    END

User enters amount
  Click Element  //input[@placeholder='Enters stake']
  Clear Element Text  //input[@placeholder='Enters stake']
  Input Text  //input[@placeholder='Enters stake']  1


User clicks on place bet
  Click Element  //button[@type='normal']


Bet should be placed successfuly
  Wait Until Element Is Visible  //p[@class='message']