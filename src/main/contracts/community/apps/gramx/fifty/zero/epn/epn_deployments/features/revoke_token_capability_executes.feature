# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Revoke Token to work so I can use Operators.

  @EALC9028 @EAIV9015.eamvt9028 @EAIV9025 @EAIV9015
  Scenario: Revoke Token capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    And EAIV9025 (Picked Token) is set to "test-value"
    When capability EALC9028 (Revoke Token) is invoked
    Then EAIV9015 (Site) is not empty
