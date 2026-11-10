# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gramx
  # As a user, I want Say In Gramx to work so I can use Gramx.

  @EALC15020 @EAIV15026.EAMVT15006 @EAIV15031 @EAIV15031 @EAIV15027
  Scenario: Say In Gramx capability executes
    Given EAIV15026.EAMVT15006 (EAIV15026.EAMVT15006) is set to "test-value"
    And EAIV15031 (Say Text) is set to "hello from scenario test"
    When capability EALC15020 (Say In Gramx) is invoked
    Then EAIV15031 (Say Text) is not empty
    Then EAIV15027 (Open Gramx) is not empty
