# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Cancel Add Member to work so I can use Circle.

  @EALC15006 @EAIV15005
  Scenario: Cancel Add Member capability executes
    Given the Circle eApp is open
    When capability EALC15006 (Cancel Add Member) is invoked
    Then EAIV15005 (Add DID Error) is not empty
