# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gramx
  # As a user, I want Connect Site Source to work so I can use Gramx.

  @EALC15026 @EAIV15026.EAMVT15006 @EAIV15034 @EAIV15035 @EAIV15027
  Scenario: Connect Site Source capability executes
    Given EAIV15026.EAMVT15006 (EAIV15026.EAMVT15006) is set to "test-value"
    And EAIV15034 (Owned Field One) is set to "test-value"
    And EAIV15035 (Owned Field Two) is set to "test-value"
    When capability EALC15026 (Connect Site Source) is invoked
    Then EAIV15027 (Open Gramx) is not empty
