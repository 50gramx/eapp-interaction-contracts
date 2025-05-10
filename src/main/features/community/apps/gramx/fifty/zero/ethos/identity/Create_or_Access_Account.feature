
Feature: Create or Access Account

  Scenario: User creates a new account
    Given the user is on the account creation page
    When the user enters all required details
    And the user clicks the "Create Account" button
    Then the user should receive a confirmation message saying "Account created successfully"
    And the user should be redirected to their account dashboard

  Scenario: User accesses an existing account
    Given the user has an existing account
    When the user enters their Ethos Code Name and authentication details
    And the user clicks the "Log In" button
    Then the user should be redirected to their account dashboard

  Scenario: User attempts to create an account with an existing Ethos Code Name
    Given the user is on the account creation page
    When the user enters an Ethos Code Name that is already in use
    And the user clicks the "Create Account" button
    Then the user should see an error message saying "This Ethos Code Name is already taken"
    And the user should be asked to choose a different code name
