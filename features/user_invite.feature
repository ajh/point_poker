Feature: User gets invited to a game
  In order to join a game created by a team member
  As an anonymous user
  I want to join the game so I can help point stories

  Scenario: Follow a link
    Given A game exists
    When I visit that games page
    Then I should see the new user form
    When I fill in the new user form and submit it
    Then I should be on that games show page
