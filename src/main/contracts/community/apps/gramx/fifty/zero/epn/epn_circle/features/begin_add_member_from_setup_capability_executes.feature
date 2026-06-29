# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Begin Add Member From Setup to work so I can use Circle.

  @EALC15004 @EAIV15003 @EAIV15002 @EAIV15005
  Scenario: Begin Add Member From Setup capability executes
    Given the Circle eApp is open
    When capability EALC15004 (Begin Add Member From Setup) is invoked
    Then EAIV15003 (Circle Return State) is not empty
    Then EAIV15002 (Circle Wizard State) is not empty
    Then EAIV15005 (Add DID Error) is not empty
