# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gramx
  # As a user, I want Pick Owned Row to work so I can use Gramx.

  @EALC15021 @EAIV15034
  Scenario: Pick Owned Row capability executes
    Given the Gramx eApp is open
    When capability EALC15021 (Pick Owned Row) is invoked
    Then EAIV15034 (Owned Field One) is not empty
