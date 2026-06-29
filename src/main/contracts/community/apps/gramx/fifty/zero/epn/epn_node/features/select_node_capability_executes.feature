# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Select Node to work so I can use Node.

  @EALC14025 @EAIV14023 @EAIV14024 @EAIV14025
  Scenario: Select Node capability executes
    Given the Node eApp is open
    When capability EALC14025 (Select Node) is invoked
    Then EAIV14023 (Selected Node Id) is not empty
    Then EAIV14024 (Selected Node Label) is not empty
    Then EAIV14025 (Selected Node State) is not empty
