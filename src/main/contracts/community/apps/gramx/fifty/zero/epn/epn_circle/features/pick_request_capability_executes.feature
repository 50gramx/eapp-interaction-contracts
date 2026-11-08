# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gramx
  # As a user, I want Pick Request to work so I can use Gramx.

  @EALC15018 @EAIV15029 @EAIV15030
  Scenario: Pick Request capability executes
    Given the Gramx eApp is open
    When capability EALC15018 (Pick Request) is invoked
    Then EAIV15029 (Picked Request) is not empty
    Then EAIV15030 (Picked Request Text) is not empty
