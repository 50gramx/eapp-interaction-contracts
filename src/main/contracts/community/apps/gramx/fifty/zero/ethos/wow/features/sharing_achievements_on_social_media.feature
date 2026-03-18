Feature: wow
  # As a social gamer named Samantha Lopez, I want to share my game achievements on social media directly from the Main Page so that I can celebrate with my friends.

  @EALC1005 @EALC1006 @EALC1007 @EAIC1010 @EAIC1011 @EAIC1012 @EAIT1003 @EAIP1001
  Scenario: Sharing Achievements on Social Media
    Given I am on the Main Page of the app
    When I tap on the 'Share Achievement' button
    Then I should see options to share my achievement on various social media platforms
