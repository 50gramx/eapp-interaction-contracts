Feature: snake-game
  # As a user, I want snake-game to open so I can use it.

  Scenario: Open the app
    Given the snake-game eApp is installed
    When I open the app from the library
    Then the app renders its first page
    And a screenshot is captured as visual evidence
