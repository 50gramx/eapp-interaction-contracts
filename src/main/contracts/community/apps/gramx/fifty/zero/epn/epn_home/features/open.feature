Feature: Open EP&N Home
  As an EP&N operator
  I want the Home eApp to open
  So that I can reach my mesh control surface

  # Universal smoke scenario — present for every EP&N eApp. Proves the app
  # loads and renders its first page. Graded by the host instrumentation at
  # visual + structural(page-level) levels; component-level render conformance
  # is a deferred upgrade (plan #10).
  Scenario: open the app
    Given the EP&N Home eApp is installed
    When I open the app from the library
    Then the Home page renders
    And a screenshot is captured as visual evidence
