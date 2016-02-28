Feature: Add

  Scenario: Add empty stack
    When I add
    Then a failure should be reported

  Scenario: Add single value
    When I push '5'
    And I add
    Then a failure should be reported

  Scenario: Add two values
    When I push '3'
    And I push '25'
    And I add
    Then the result should be '28'
