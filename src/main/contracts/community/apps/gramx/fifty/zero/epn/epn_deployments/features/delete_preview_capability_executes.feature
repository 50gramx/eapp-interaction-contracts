# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Delete Preview to work so I can use Operators.

  @EALC9024 @EAIV9015.eamvt9028 @EAIV9024 @EAIV9015
  Scenario: Delete Preview capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    And EAIV9024 (Picked Preview) is set to "test-value"
    When capability EALC9024 (Delete Preview) is invoked
    Then EAIV9015 (Site) is not empty
