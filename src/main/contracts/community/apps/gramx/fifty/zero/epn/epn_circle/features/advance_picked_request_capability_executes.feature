# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gramx
  # As a user, I want Advance Picked Request to work so I can use Gramx.

  @EALC15019 @EAIV15026.EAMVT15006 @EAIV15029 @EAIV15027
  Scenario: Advance Picked Request capability executes
    Given EAIV15026.EAMVT15006 (EAIV15026.EAMVT15006) is set to "test-value"
    And EAIV15029 (Picked Request) is set to "test-value"
    When capability EALC15019 (Advance Picked Request) is invoked
    Then EAIV15027 (Open Gramx) is not empty
