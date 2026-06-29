# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Submit Add Member As Admin to work so I can use Circle.

  @EALC15016 @EAIV15007
  Scenario: Submit Add Member As Admin capability executes
    Given the Circle eApp is open
    When capability EALC15016 (Submit Add Member As Admin) is invoked
    Then EAIV15007 (Add DID Result) is not empty
