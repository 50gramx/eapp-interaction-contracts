# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gramx
  # As a user, I want Copy Own DID to work so I can use Gramx.

  @EALC15013 @EAIV15017
  Scenario: Copy Own DID capability executes
    Given the Gramx eApp is open
    When capability EALC15013 (Copy Own DID) is invoked
    Then EAIV15017 (Copy Result) is not empty
