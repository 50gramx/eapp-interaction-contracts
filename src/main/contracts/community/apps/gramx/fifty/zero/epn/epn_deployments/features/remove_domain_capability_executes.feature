# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Remove Domain to work so I can use Operators.

  @EALC9016 @EAIV9015.EAMVT9028 @EAIV9018 @EAIV9015
  Scenario: Remove Domain capability executes
    Given EAIV9015.EAMVT9028 (EAIV9015.EAMVT9028) is set to "test-value"
    And EAIV9018 (Picked Domain) is set to "test-value"
    When capability EALC9016 (Remove Domain) is invoked
    Then EAIV9015 (Site) is not empty
