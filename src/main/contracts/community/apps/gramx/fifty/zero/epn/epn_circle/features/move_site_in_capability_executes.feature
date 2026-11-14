# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gramx
  # As a user, I want Move Site In to work so I can use Gramx.

  @EALC15027 @EAIV15026.EAMVT15006 @EAIV15034 @EAIV15035 @EAIV15027
  Scenario: Move Site In capability executes
    Given EAIV15026.EAMVT15006 (EAIV15026.EAMVT15006) is set to "test-value"
    And EAIV15034 (Owned Field One) is set to "test-value"
    And EAIV15035 (Owned Field Two) is set to "test-value"
    When capability EALC15027 (Move Site In) is invoked
    Then EAIV15027 (Open Gramx) is not empty
