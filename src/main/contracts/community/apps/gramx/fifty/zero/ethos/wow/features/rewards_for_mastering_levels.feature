Feature: wow
  # As a competitive gamer named Mark Chen, I want to earn in-game rewards for completing game levels so that I can feel recognized for my skills.

  @EALC1004 @EAIC1008 @EAIC1009 @EAIT1002 @EAIV1002 @EAIP1001
  Scenario: Rewards for Mastering Levels
    Given I have completed a game level
    When I reach the end of the level
    Then I should receive an in-game reward notification
