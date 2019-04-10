# language: en 

@search
Feature: Search new Pokemon and old Pokemons to my Pokedex

    Background: Login Screen 
        Given open pokedex
        And on login screen
        And insert user name "tassioplima" and password

    @pokemon_search
    Scenario: Search wild pokemon
        When search a pokemon "Pikachu"
        Then wild pokemon appeared!

    @incorrect_search
    Scenario: Search new pokemon
        When search a pokemon "Mirachu"
        Then wild pokemon disappeared!