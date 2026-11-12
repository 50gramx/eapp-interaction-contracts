# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Add Domain to work so I can use Operators.

  @EALC9014 @EAIV9015.eamvt9028 @EAIV9016 @EAIV9016 @EAIV9015
  Scenario: Add Domain capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    And EAIV9016 (Domain Text) is set to "hello from scenario test"
    When capability EALC9014 (Add Domain) is invoked
    Then EAIV9016 (Domain Text) is not empty
    Then EAIV9015 (Site) is not empty
