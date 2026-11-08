# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Init Page to work so I can use Settings.

  @EALC12001 @EAIV12001 @EAIV12036 @EAIV12006 @EAIV12035 @EAIV12007 @EAIV12013 @EAIV12019
  Scenario: Init Page capability executes
    Given the Settings eApp is open
    When capability EALC12001 (Init Page) is invoked
    Then EAIV12001 (Spend Policy) is not empty
    Then EAIV12036 (Start Gram With App) is not empty
    Then EAIV12006 (KYC Status) is not empty
    Then EAIV12035 (Claim State Result) is not empty
    Then EAIV12007 (Energy Policy) is not empty
    Then EAIV12013 (Keys Status) is not empty
    Then EAIV12019 (Nodes List) is not empty
