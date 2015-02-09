@future
Feature: Suspend an inactive game
  In order conserve heroku dyno time
  As the sysadmin
  I want to suspend games that are inactive for some time

  Scenario: suspend an inactive game
    Given a game exists
    When it has has not activity for some time
    Then the websockets should close

  Scenario: suspend notification
    Given a game exists
    And a player is on the game page
    And it has has not activity for some time
    When the websockets close
    Then the player should see a notice explaining that the game has suspended

  Scenario: resume a suspended game
    Given a game exists
    And it has has been suspended
    When a player refreshes their browser
    Then the websockets should resume
