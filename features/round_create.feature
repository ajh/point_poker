Feature: Create a round
  In order to solicit estimates from the team
  As a player
  I want to create a round

  Scenario: Create a round
    Given A game exists
    And I visit the game page
    When I fill in the new round page and submit it
    Then I should see a new round has been added

  Scenario: Create a bunch of rounds
    Given A game exists
    And I visit the game page
    When I fill in the new round page and submit it a bunch of times
    Then I should see a bunch of new rounds have been added
