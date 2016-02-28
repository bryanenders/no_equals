Feature: Subtract

  Scenario: Subtract empty stack
    When I subtract
    Then a failure should be reported

  Scenario: Subtract single value
    When I push '93'
    And I subtract
    Then a failure should be reported

  Scenario: Subtract two values
    When I push '8'
    And I push '15'
    And I subtract
    Then the result should be '-7'
