Feature: test
  # As an Unskilled Labor Provider named Ramesh Kumar, I want to search for flexible labor opportunities in my local area so that I can utilize my free time effectively and earn extra income.

  @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EALC1001 @EALC1002 @EAIP1001 @EAIC1001 @EAIC1002 @EAIC1003 @EAIT1001
  Scenario: Find Flexible Labor Opportunities
    Given I am on the Main Page of the app
    When I select the 'Search Opportunities' button
    When I filter opportunities by my local area
    When I view the list of available tasks
    Then I should see a list of tasks that I can apply for
    Then each task should include details like timing, pay, and location
