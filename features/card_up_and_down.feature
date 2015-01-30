Feature: Played cards can be face up or face down
  In order to not have players be influenced by others
  As a player
  I want to see face down played cards until all players have played the story

  Scenario: Other's cards are face down
    Given I am playing a story with one other player
    When The other player has played
    And I have not played
    Then the other players card should be face down

  Scenario: My played cards are face up
    Given I am playing a story with another player
    When The other player has not played
    And I have played
    Then my cards are face up

  Scenario: Cards are revealed after everyone plays
    Given I am playing a story with two other players
    When The other players have played
    And I have played
    Then all cards are face up

  Scenario: Cards stay face up if another player joins
    Given I am playing a story with another player
    When The everyone has played
    And another player joins the game
    And I refresh the page
    Then all cards are still face up
