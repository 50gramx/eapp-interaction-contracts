# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Roll Back Site to work so I can use Operators.

  @EALC9019 @EAIV9015.EAMVT9028 @EAIV9015
  Scenario: Roll Back Site capability executes
    Given EAIV9015.EAMVT9028 (EAIV9015.EAMVT9028) is set to "test-value"
    When capability EALC9019 (Roll Back Site) is invoked
    Then EAIV9015 (Site) is not empty
