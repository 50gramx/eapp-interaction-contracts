# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gramx
  # As a user, I want Open Gramx to work so I can use Gramx.

  @EALC15017 @EAIV15027
  Scenario: Open Gramx capability executes
    Given the Gramx eApp is open
    When capability EALC15017 (Open Gramx) is invoked
    Then EAIV15027 (Open Gramx) is not empty
