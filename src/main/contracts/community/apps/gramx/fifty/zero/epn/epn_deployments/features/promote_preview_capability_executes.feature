# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Promote Preview to work so I can use Operators.

  @EALC9023 @EAIV9015.eamvt9028 @EAIV9024 @EAIV9015
  Scenario: Promote Preview capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    And EAIV9024 (Picked Preview) is set to "test-value"
    When capability EALC9023 (Promote Preview) is invoked
    Then EAIV9015 (Site) is not empty
