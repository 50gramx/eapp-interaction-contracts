# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Create Site to work so I can use Operators.

  @EALC9020 @EAIV9022 @EAIV9015 @EAIV9022 @EAIV9013
  Scenario: Create Site capability executes
    Given EAIV9022 (New Site Name) is set to "test-value"
    When capability EALC9020 (Create Site) is invoked
    Then EAIV9015 (Site) is not empty
    Then EAIV9022 (New Site Name) is not empty
    Then EAIV9013 (Sites) is not empty
