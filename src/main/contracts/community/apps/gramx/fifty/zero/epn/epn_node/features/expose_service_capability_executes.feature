# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Expose Service to work so I can use Node.

  @EALC14011 @EAIV14011 @EAIV14012
  Scenario: Expose Service capability executes
    Given the Node eApp is open
    When capability EALC14011 (Expose Service) is invoked
    Then EAIV14011 (Expose Result) is not empty
    Then EAIV14012 (My Identity) is not empty
