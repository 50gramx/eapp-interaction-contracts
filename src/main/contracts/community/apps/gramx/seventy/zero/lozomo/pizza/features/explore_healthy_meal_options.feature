Feature: localzomatoforhsr
  # As a Busy Professional named Amit Sharma, I want to view healthy meal options so that I can choose nutritious food for my work lunch.

  @EAIV1002 @EAIV1003 @EALC1001 @EAIP1001 @EAIC1002 @EAIC1003 @EAIT1001
  Scenario: Explore Healthy Meal Options
    Given I am on the Main Page of the localzomatoforhsr app
    When I click on the 'Healthy Options' category
    Then I should see a list of healthy meals available for order
