@future
Feature: Close a story with a timer
  In order to wrap up voting
  As a player
  I want to start a timer to end a story

  Scenario: Close a story without any plays
    Given A story exists
    And I visit the game page
    When I start the timer on the story
    And the timer expires
    Then I should see the story is closed

  Scenario: Close a story with incomplete plays
    Given A story exists
    And all players but one have voted
    And I visit the game page
    When I start the timer on the story
    And the timer expires
    Then I should see the story is closed
    And the played cards should be face up

  Scenario: story completes before timer expires
    Given A story exists
    And all players but one have voted
    And I visit the game page
    When I start the timer on the story
    And and the last player plays their hand before the timer expires
    Then I should see the story is closed
    And the played cards should be face up
