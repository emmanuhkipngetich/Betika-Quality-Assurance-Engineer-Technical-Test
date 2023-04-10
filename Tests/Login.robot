*** Settings ***
Documentation  Betika Login Test
Resource  ../Resources/keywords.robot

** Variables ***
${start_value}  1
${end_value}    10

*** Test Cases ***
User logs in incorrect credentials
    Opening Browser
    User inputs username
    User inputs wrong password
    User clicks login
    User should be notified of incorrect details
    Close Browser

User Logs in successfully
    [tags]  Login
    Opening Browser
    User inputs username
    User inputs password
    User clicks login
    User should be logged in successfully
    Close Browser

User places bet successfully
  Opening Browser
    User inputs username
    User inputs password
    User clicks login
    User should be logged in successfully
    User selects the lowest odds
    User enters amount
    User clicks on place bet
    Bet should be placed successfuly
    Close Browser
