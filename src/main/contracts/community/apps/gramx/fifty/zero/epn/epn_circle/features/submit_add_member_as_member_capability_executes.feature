# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Submit Add Member As Member to work so I can use Circle.

  @EALC15005 @EAIV15007
  Scenario: Submit Add Member As Member capability executes
    Given the Circle eApp is open
    When capability EALC15005 (Submit Add Member As Member) is invoked
    Then EAIV15007 (Add DID Result) is not empty
