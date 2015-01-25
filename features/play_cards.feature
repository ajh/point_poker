Feature: Play cards
  In order to show other players in my game how many points I think a story is worth
  As a player
  I want to play cards

  Scenario: Play a card
    Given A round exists
    And I visit the game page
    When I choose a card for the round
    Then I should see the card has been played

  Scenario: Remove a play
    Given A round exists
    And I visit the game page
    And I have played a card for the round
    When I choose to remove my played card
    Then I should not see any card that I have played

  Scenario: Remove a play and play again
    Given A round exists
    And I visit the game page
    And I have played a card for the round
    And I have removed my play
    When I choose a card for the round
    Then I should see the card has been played
