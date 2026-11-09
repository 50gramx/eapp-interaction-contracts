# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gram
  # As a user, I want On Node Page Appear to work so I can use Gram.

  @EALC14020 @EAIV14012 @EAIV14020 @EAIV14049 @EAIV14051 @EAIV14052
  Scenario: On Node Page Appear capability executes
    Given the Gram eApp is open
    When capability EALC14020 (On Node Page Appear) is invoked
    Then EAIV14012 (My Identity) is not empty
    Then EAIV14020 (Nodes) is not empty
    Then EAIV14049 (Node Capabilities) is not empty
    Then EAIV14051 (Grams) is not empty
    Then EAIV14052 (This Gram) is not empty
