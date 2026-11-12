# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Pause Site to work so I can use Operators.

  @EALC9030 @EAIV9015.eamvt9028 @EAIV9015
  Scenario: Pause Site capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    When capability EALC9030 (Pause Site) is invoked
    Then EAIV9015 (Site) is not empty
