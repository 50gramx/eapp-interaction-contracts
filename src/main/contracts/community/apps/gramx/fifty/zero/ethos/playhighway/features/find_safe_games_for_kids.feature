Feature: playhighway
  # As a parent named Sarah Thompson, I want to find educational and family-friendly games for my children so that I can ensure they are playing safe content.

  @EAIV1005 @EAIV1006 @EAIC1009 @EAIC1010 @EAIC1011 @EAIC1012 @EAIT1003 @EAIV1001 @EAIV1002 @EALC1005 @EAIP1001
  Scenario: Find Safe Games for Kids
    Given I am on the Main Page of the playhighway app
    When I navigate to the 'Family Games' section
    When I use the age filter to select games appropriate for my children
    Then I should see a list of recommended family-friendly games
    And I should have the option to read reviews from other parents
