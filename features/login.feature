# language: en 

@login
Feature: Login for Pokedex

    Background: Login Screen 
        Given open pokedex
        And on login screen

    @happy_path
    Scenario: Sign in login
        When insert user name "tassioplima" and password
        Then we are logged 

    @incorrect_login
    Scenario: Incorrect login user name or password
        When insert user name "tassioplima" and wrong password
        Then receive feedback your user name or password is incorrect

    @logout
    Scenario: Logout of login page
        When insert user name "tassioplima" and password
        And realize logoff
        Then we are unlogged
