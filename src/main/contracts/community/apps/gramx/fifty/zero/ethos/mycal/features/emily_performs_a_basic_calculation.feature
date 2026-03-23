Feature: mycal
  # As a student named Emily Johnson, I want to perform basic calculations quickly so that I can focus on my math problem-solving.

  Scenario: Emily performs a basic calculation
    Given Emily is on the Main Page of mycal
    When Emily taps '3'
    When Emily taps '+'
    When Emily taps '7'
    When Emily taps '='
    Then the result displayed should be '10'
