Feature: Get result

  Scenario: Initial state
    Then there should be no result

  Scenario: Compound equation
    When I push '7'
    And I push '5'
    And I push '1'
    And I push '2'
    And I add
    And I push '4'
    And I multiply
    And I add
    And I push '3'
    And I subtract
    And I divide
    Then the result should be '0.5'
