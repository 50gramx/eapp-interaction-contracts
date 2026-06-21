Feature: Open EP&N Circle
  As an EP&N operator
  I want the Circle eApp to open
  So that I can manage who this device meshes and schedules work with

  # Universal smoke scenario — present for every EP&N eApp. Proves the app
  # loads and renders its first page. Graded by the host instrumentation at
  # visual + structural(page-level) levels; component-level render conformance
  # is a deferred upgrade.
  Scenario: open the app
    Given the EP&N Circle eApp is installed
    When I open the app from the library
    Then the Circle page renders
    And a screenshot is captured as visual evidence
