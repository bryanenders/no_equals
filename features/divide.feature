Feature: Divide

  Scenario: Divide empty stack
    When I divide
    Then a failure should be reported

  Scenario: Divide single value
    When I push '99'
    And I divide
    Then a failure should be reported

  Scenario: Divide two values
    When I push '1'
    And I push '2'
    And I divide
    Then the result should be '0.5'

  Scenario: Divide by zero
    When I push '7.5'
    And I push '0'
    And I divide
    Then a failure should be reported
