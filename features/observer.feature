Feature: observer can watch but not participate
  In order to watch the game so I can follow the conversation
  As a chicken
  I want to observe the game

  Scenario: Get invited to a game and join as an observer
    Given A game exists
    When I visit that games page
    Then I should see the new user form
    When I fill in the new user form as an observer and submit it
    Then I should be on that games show page

  Scenario: An observer can see an incomplete story
    Given a story exists
    And I am an observer
    When several players play cards
    Then I should see the cards face down

  Scenario: An observer can see a complete story
    Given a story exists
    And I am an observer
    When all players play cards
    Then I should see the cards face up

  Scenario: An observer can not participate
    Given a story exists
    And I am an observer
    Then I see no option to play cards
