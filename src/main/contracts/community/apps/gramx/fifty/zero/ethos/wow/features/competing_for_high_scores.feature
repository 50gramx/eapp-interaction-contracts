Feature: wow
  # As a competitive gamer named Mark Chen, I want to view the leaderboard on the Main Page so that I can check my ranking and challenge my friends.

  @EAIV1003 @EAIC1003 @EAIC1004 @EAIC1005 @EAIV1001 @EALC1001 @EAIP1001
  Scenario: Competing for High Scores
    Given I am on the Main Page of the app
    When I tap on the 'Leaderboard' button
    Then I should see my ranking and the scores of my friends
