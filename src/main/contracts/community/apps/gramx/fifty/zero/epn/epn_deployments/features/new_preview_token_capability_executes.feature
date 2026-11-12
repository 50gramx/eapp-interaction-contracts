# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want New Preview Token to work so I can use Operators.

  @EALC9026 @EAIV9015.eamvt9028 @EAIV9026 @EAIV9015
  Scenario: New Preview Token capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    And EAIV9026 (Token Label Text) is set to "hello from scenario test"
    When capability EALC9026 (New Preview Token) is invoked
    Then EAIV9015 (Site) is not empty
