Feature: Create a game
  In order to have a team point a bunch of stories
  As an anonymous user
  I want to be able to create a game and invite team members

  Scenario: Create a game
    Given I visit the home page
    When I fill in the quick start form and submit it
    Then I should be on the game show page

  @future
  Scenario: Choose point scheme
    Given I visit the new game page
    Then I should see options to choose the point scheme like fibonacci
