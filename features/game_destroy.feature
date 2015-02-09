@future
Feature: Destroy a game
  In order to end a game that has been finished
  As a player
  I want to destroy a game

  Scenario: destroy a game
    Given a game exists
    And I visit that games page
    When I choose to destroy the game
    Then I should be brought back to the home page

  Scenario: another player cancels the destroy
    Given a game exists
    And I visit that games page
    When I choose to destroy the game
    And another player cancels the destroy
    Then I should still be on the game page

  Scenario: I cancel another player's destroy
    Given a game exists
    And I visit that games page
    When another player destroys the game
    And I cancel the destroy
    Then I should still be on the game page
