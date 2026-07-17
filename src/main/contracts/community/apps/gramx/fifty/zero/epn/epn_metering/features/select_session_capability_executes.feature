# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Metering
  # As a user, I want Select Session to work so I can use Metering.

  @EALC11003 @EAIV11010 @EAIV11011 @EAIV11012 @EAIV11013 @EAIV11014 @EAIV11015 @EAIV11016 @EAIV11017 @EAIV11018 @EAIV11019 @EAIV11020 @EAIV11021
  Scenario: Select Session capability executes
    Given the Metering eApp is open
    When capability EALC11003 (Select Session) is invoked
    Then EAIV11010 (Selected Session ID) is not empty
    Then EAIV11011 (Selected Session Operator) is not empty
    Then EAIV11012 (Selected Session Deployment) is not empty
    Then EAIV11013 (Selected Session Pod) is not empty
    Then EAIV11014 (Selected Session Receipts) is not empty
    Then EAIV11015 (Selected Session Amount UETC) is not empty
    Then EAIV11016 (Selected Session When) is not empty
    Then EAIV11017 (Selected Session Status) is not empty
    Then EAIV11018 (Selected Session Resources) is not empty
    Then EAIV11019 (Selected Session Publish Status) is not empty
    Then EAIV11020 (Selected Session Replica Peers) is not empty
    Then EAIV11021 (Selected Session State) is not empty
