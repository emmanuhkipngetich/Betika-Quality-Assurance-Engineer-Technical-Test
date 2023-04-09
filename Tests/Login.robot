*** Settings ***
Documentation  Betika Login Test
Resource  ../Resources/keywords.robot

*** Test Cases ***
User logs in incorrect credentials
    Opening Browser
    User inputs username
    User inputs wrong password
    User clicks login
    User should be notified of incorrect details

User Logs in successfully
    [tags]  Login
    Opening Browser
    User inputs username
    User inputs password
    User clicks login
    User should be logged in successfully

User places bet successfully
  Opening Browser
    User inputs username
    User inputs password
    User clicks login
    User should be logged in successfully
    User selects bet to add to betslip
    User enters amount
    User clicks on place bet
    Bet should be placed successfuly
