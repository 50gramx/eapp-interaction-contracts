
Feature: Enter Ethos Code Name

  Scenario: User enters Ethos Code Name successfully
    Given the user is on the Ethos Code Name entry page
    When the user enters a valid Ethos Code Name
    And the user clicks the "Submit" button
    Then the user should be prompted to proceed with authentication

  Scenario: User enters an invalid Ethos Code Name
    Given the user is on the Ethos Code Name entry page
    When the user enters an invalid Ethos Code Name
    And the user clicks the "Submit" button
    Then the user should see an error message saying "Invalid Ethos Code Name"
    And the user should be prompted to re-enter the code name
