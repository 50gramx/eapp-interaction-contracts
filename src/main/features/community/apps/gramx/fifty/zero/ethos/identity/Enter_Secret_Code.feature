
Feature: Enter Secret Code for Authentication

  Scenario: User enters the correct secret code
    Given the user is prompted to enter a secret code
    When the user enters the correct secret code received via SMS
    And the user clicks "Submit"
    Then the user should be authenticated and proceed to access their account

  Scenario: User enters the incorrect secret code
    Given the user is prompted to enter a secret code
    When the user enters an incorrect secret code
    And the user clicks "Submit"
    Then the user should see an error message saying "Incorrect secret code"
    And the user should be asked to re-enter the secret code

  Scenario: User does not enter any secret code
    Given the user is prompted to enter a secret code
    When the user leaves the secret code field blank
    And the user clicks "Submit"
    Then the user should see an error message saying "Secret code is required"
