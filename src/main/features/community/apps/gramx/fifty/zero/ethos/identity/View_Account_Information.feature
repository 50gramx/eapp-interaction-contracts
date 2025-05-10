
Feature: View Account Information

  Scenario: User views their account details
    Given the user is logged into their account
    When the user clicks the "Account Details" tile
    Then the user should be redirected to the account details page
    And the user should see their account information

  Scenario: User cannot view account details if not logged in
    Given the user is not logged into their account
    When the user clicks the "Account Details" tile
    Then the user should be redirected to the login page

  Scenario: User views account information with missing fields
    Given the user is logged into their account
    When the account details page loads and some fields are missing
    Then the user should see a message saying "Some account details are missing"
    And the user should be given an option to update their details
