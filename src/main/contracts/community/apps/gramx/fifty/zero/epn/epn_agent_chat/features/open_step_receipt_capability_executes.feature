# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Open Step Receipt to work so I can use Evo.

  @EALC6030 @EAIV6050 @EAIV6046
  Scenario: Open Step Receipt capability executes
    Given the Evo eApp is open
    When capability EALC6030 (Open Step Receipt) is invoked
    Then EAIV6050 (Open Receipt) is not empty
    Then EAIV6046 (View Mode) is not empty
