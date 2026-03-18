Feature: wow
  # As a social gamer named Samantha Lopez, I want to invite my friends through the app's Friend List so that we can play together and bond over the game.

  @EALC1002 @EALC1003 @EAIC1006 @EAIC1007 @EAIP1001
  Scenario: Connecting with Friends
    Given I am on the Main Page of the app
    When I tap on the 'Friends' icon
    And I select friends to invite
    Then my friends should receive an invitation to join my game session
