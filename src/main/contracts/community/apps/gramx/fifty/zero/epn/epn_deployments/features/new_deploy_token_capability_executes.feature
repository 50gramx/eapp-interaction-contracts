# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want New Deploy Token to work so I can use Operators.

  @EALC9017 @EAIV9015.eamvt9028 @EAIV9015
  Scenario: New Deploy Token capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    When capability EALC9017 (New Deploy Token) is invoked
    Then EAIV9015 (Site) is not empty
