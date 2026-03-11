Feature: playhighway
  # As a casual gamer named Alex Johnson, I want to easily join multiplayer sessions with my friends so that we can have fun together without the stress of competition.

  @EALC1003 @EALC1004 @EAIC1004 @EAIC1005 @EAIT1001 @EAIP1001
  Scenario: Join a Multiplayer Session
    Given I have received an invitation from a friend to join a session
    When I click on the 'Join Session' button in the notification
    When I confirm my participation
    Then I should be taken directly to the game lobby
    And I should see my friends' profiles listed in the session
