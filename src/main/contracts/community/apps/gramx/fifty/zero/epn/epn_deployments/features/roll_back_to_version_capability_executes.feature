# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Roll Back To Version to work so I can use Operators.

  @EALC9021 @EAIV9015.eamvt9028 @EAIV9023 @EAIV9023 @EAIV9015
  Scenario: Roll Back To Version capability executes
    Given EAIV9015.eamvt9028 (EAIV9015.eamvt9028) is set to "test-value"
    And EAIV9023 (Picked Version) is set to "test-value"
    When capability EALC9021 (Roll Back To Version) is invoked
    Then EAIV9023 (Picked Version) is not empty
    Then EAIV9015 (Site) is not empty
