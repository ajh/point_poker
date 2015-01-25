Feature: Close a round
  In order to know when everyone has played
  As a player
  I want to see a round is closed

  Scenario: display average mean of played cards
    Given A round exists
    When that round closes
    Then I should see the mean of the played cards

  Scenario: display standard deviation of played cards
    Given A round exists
    When that round closes
    Then I should see the standard deviation of the played cards

  Scenario: display a high standard deviation in an alarming manner
    Given A round exists
    When that round closes
    Then I should see the standard deviation displayed in an alarming manner

  Scenario: display the duration of the round
    Given A round exists
    When that round closes
    Then I should see how long the round was open
