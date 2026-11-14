# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Restore Site to work so I can use Operators.

  @EALC9042 @EAIV9015.eamvt9028 @EAIV9015
  Scenario: Restore Site capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    When capability EALC9042 (Restore Site) is invoked
    Then EAIV9015 (Site) is not empty
