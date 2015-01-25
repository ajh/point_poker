Feature: Kick a player
  In order to remove a player that may have abandoned the game
  As a player
  I want to kick out another player

  Scenario: Kick out a player
    Given A game exists with two other players
    When I choose to kick out another player
    Then I should see the player was removed

  Scenario: Kicked player was holding up a round
    Given A game exists with two other players
    And A round exists
    And all players but one have voted in the round
    When I choose to kick out the non voting player
    Then the round should be closed
    And the played cards should be face up
