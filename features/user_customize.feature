Feature:

  Scenario: customize card suit
    Given I visit a new user form
    Then I should see options to choose the card suit

  Scenario: customize card back
    Given I visit a new user form
    Then I should see options to choose the card back picture

  Scenario: customize 10 card
    Given I visit a new user form
    Then I should see options to choose the 10 card, either 10, jack, queen or king
