Feature: Multiply

  Scenario: Multiply empty stack
    When I multiply
    Then a failure should be reported

  Scenario: Multiply single value
    When I push '1.43'
    And I multiply
    Then a failure should be reported

  Scenario: Multiply two values
    When I push '-9'
    And I push '-10'
    And I multiply
    Then the result should be '90'
