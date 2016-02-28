Feature: Push

  Scenario: Push multiple values
    When I push '4'
    And I push '8'
    And I push '15'
    And I push '16'
    And I push '23'
    And I push '-0.42'
    Then the result should be '-0.42'
