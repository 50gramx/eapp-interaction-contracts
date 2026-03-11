Feature: playhighway
  # As a hardcore gamer named Jamie Lee, I want to track my personal gaming statistics and achievements so that I can see my progress and compete effectively.

  @EAIV1004 @EALC1005 @EAIC1006 @EAIC1007 @EAIC1008 @EAIT1002 @EAIV1001 @EAIP1001
  Scenario: Track Gaming Achievements
    Given I am logged into my profile on the Main Page
    When I select the 'Achievements' section from my profile menu
    When I view my gaming statistics
    Then I should see a detailed breakdown of my achievements
    And I should have the option to filter achievements by game
