Feature: Close a round with a timer
  In order to wrap up voting
  As a player
  I want to start a timer to end a round

  Scenario: Close a round without any plays
    Given A round exists
    And I visit the game page
    When I start the timer on the round
    And the timer expires
    Then I should see the round is closed

  Scenario: Close a round with incomplete plays
    Given A round exists
    And all players but one have voted
    And I visit the game page
    When I start the timer on the round
    And the timer expires
    Then I should see the round is closed
    And the played cards should be face up

  Scenario: Round completes before timer expires
    Given A round exists
    And all players but one have voted
    And I visit the game page
    When I start the timer on the round
    And and the last player plays their hand before the timer expires
    Then I should see the round is closed
    And the played cards should be face up
