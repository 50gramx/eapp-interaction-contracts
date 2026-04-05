Feature: localzomatoforhsr
  # As a Family Meal Planner named Suman Mehta, I want to see budget-friendly food options under the tag 70 INR without extra charges so that I can feed my family affordably.

  @EAIV1002 @EAIV1004 @EAIV1006 @EALC1001 @EALC1002 @EAIP1001 @EAIC1001 @EAIC1002 @EAIC1003 @EAIT1001
  Scenario: Find Budget-Friendly Options
    Given I am on the Main Page of the localzomatoforhsr app
    When I click on the 'Budget Eats' banner
    When I filter the meals with the tag '70 INR'
    Then I should see meals listed with their prices showing no extra charges
    Then the meals should be marked under the tag '70 INR'
