Feature: Create a story
  In order to solicit estimates from the team
  As a player
  I want to create a story

  Scenario: Create a story
    Given A game exists
    And I visit the game page
    When I fill in the new story page and submit it
    Then I should see a new story has been added

  Scenario: Create a bunch of stories
    Given A game exists
    And I visit the game page
    When I fill in the new story page and submit it a bunch of times
    Then I should see a bunch of new stories have been added
