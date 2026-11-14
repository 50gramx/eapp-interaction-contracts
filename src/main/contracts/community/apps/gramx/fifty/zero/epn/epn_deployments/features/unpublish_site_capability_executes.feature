# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Unpublish Site to work so I can use Operators.

  @EALC9041 @EAIV9015.eamvt9028 @EAIV9015
  Scenario: Unpublish Site capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    When capability EALC9041 (Unpublish Site) is invoked
    Then EAIV9015 (Site) is not empty
