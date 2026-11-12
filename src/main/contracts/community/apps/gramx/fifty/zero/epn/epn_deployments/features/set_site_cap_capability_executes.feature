# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Set Site Cap to work so I can use Operators.

  @EALC9018 @EAIV9015.eamvt9028 @EAIV9019 @EAIV9015
  Scenario: Set Site Cap capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    And EAIV9019 (Cap Text) is set to "hello from scenario test"
    When capability EALC9018 (Set Site Cap) is invoked
    Then EAIV9015 (Site) is not empty
