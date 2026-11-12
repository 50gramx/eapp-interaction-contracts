# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Resume Site to work so I can use Operators.

  @EALC9031 @EAIV9015.eamvt9028 @EAIV9015
  Scenario: Resume Site capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    When capability EALC9031 (Resume Site) is invoked
    Then EAIV9015 (Site) is not empty
