
Feature: Select Authentication Method

  Scenario: User selects an authentication method successfully
    Given the user has entered a valid Ethos Code Name
    When the user selects an authentication method
    And the user clicks "Continue"
    Then the user should be taken to the next step of authentication

  Scenario: User fails to select an authentication method
    Given the user has entered a valid Ethos Code Name
    When the user does not select any authentication method
    And the user clicks "Continue"
    Then the user should see an error message saying "Please select an authentication method"
