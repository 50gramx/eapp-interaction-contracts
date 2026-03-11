Feature: playhighway
  # As a casual gamer named Alex Johnson, I want to discover new games suitable for multiplayer sessions so that I can play with my friends and enjoy engaging experiences together.

  @EAIV1001 @EAIV1002 @EAIV1003 @EALC1001 @EALC1002 @EAIP1001 @EAIC1001 @EAIC1002 @EAIC1003
  Scenario: Discover New Games
    Given I am on the Main Page of the playhighway app
    When I navigate to the 'Game Discovery' section
    When I filter games by 'Multiplayer' category
    Then I should see a list of recommended multiplayer games
    And I should have the option to invite my friends to join these games
