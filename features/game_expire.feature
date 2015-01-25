Feature: Expire an inactive game
  In order to destroy a game has been inactive for a long time
  As the system
  I want to destroy old, inactive games

  Scenario: destroy an inactive game
    Given a game exists
    And and it has has not activity for a very long time
    When the system runs an expiry job
    Then that game should be destroyed
