Feature: localzomatoforhsr
  # As a Local Food Enthusiast named Riya Kumar, I want to browse a list of new local restaurants in HSR Layout so that I can discover exciting dining options and share them with my friends.

  @EAIV1001 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1002 @EAIT1001
  Scenario: Discover New Local Restaurants
    Given I am on the Main Page of the localzomatoforhsr app
    When I click on the 'Discover' button
    Then I should see a list of new and trending restaurants in HSR Layout
