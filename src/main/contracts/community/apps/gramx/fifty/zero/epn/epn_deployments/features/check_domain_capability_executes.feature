# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Check Domain to work so I can use Operators.

  @EALC9029 @EAIV9015.eamvt9028 @EAIV9018 @EAIV9015
  Scenario: Check Domain capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    And EAIV9018 (Picked Domain) is set to "test-value"
    When capability EALC9029 (Check Domain) is invoked
    Then EAIV9015 (Site) is not empty
