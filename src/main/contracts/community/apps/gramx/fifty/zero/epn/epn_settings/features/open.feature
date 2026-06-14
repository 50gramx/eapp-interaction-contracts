Feature: Open EP&N Settings
  As an EP&N operator
  I want the Settings eApp to open
  So that I can reach this part of my mesh control surface

  # Universal smoke scenario — present for every EP&N eApp. Proves the app
  # loads and renders its first page. Graded by the host instrumentation at
  # visual + structural(page-level) levels; component-level render conformance
  # is a deferred upgrade.
  Scenario: open the app
    Given the EP&N Settings eApp is installed
    When I open the app from the library
    Then the Settings page renders
    And a screenshot is captured as visual evidence
