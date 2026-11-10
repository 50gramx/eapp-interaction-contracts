# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gramx
  # As a user, I want Init Page to work so I can use Gramx.

  @EALC15001 @EAIV15001 @EAIV15018 @EAIV15025 @EAIV15027
  Scenario: Init Page capability executes
    Given the Gramx eApp is open
    When capability EALC15001 (Init Page) is invoked
    Then EAIV15001 (Circle Status) is not empty
    Then EAIV15018 (Latest Notice) is not empty
    Then EAIV15025 (Gramx) is not empty
    Then EAIV15027 (Open Gramx) is not empty
