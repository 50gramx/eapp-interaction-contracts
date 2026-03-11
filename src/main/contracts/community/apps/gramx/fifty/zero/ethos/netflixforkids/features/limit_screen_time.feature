Feature: netflixforkids
  # As a parent named Jessica Thompson, I want to set daily limits on screen time so that I can ensure my kids don’t overindulge.

  @EAIV1007 @EAIV1008 @EAIV1009 @EALC1005 @EAIP1002 @EAIC1009 @EAIC1010 @EAIT1001
  Scenario: Limit Screen Time
    Given I am on the Settings Page
    When I adjust the screen time limit to 1 hour
    When I save the changes
    Then I should see a message confirming the screen time limit is set to 1 hour
    And my kids should not be able to watch beyond this limit each day
