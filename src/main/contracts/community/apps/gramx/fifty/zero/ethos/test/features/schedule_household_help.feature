Feature: test
  # As a Task Requester named Anita Sharma, I want to quickly find someone to help with home cleaning so that I can ease my burden and manage my household tasks around my busy work hours.

  @EAIV1005 @EAIV1006 @EAIV1007 @EALC1003 @EALC1004 @EAIC1004 @EAIC1005 @EAIC1006 @EAIC1007 @EAIP1001 @EAIT1001
  Scenario: Schedule Household Help
    Given I am on the Main Page of the app
    When I click on the 'Request Help' button
    When I select the type of help needed and preferred timing
    When I submit the request
    Then I should receive confirmation of my request
    Then I should be able to see potential labor providers who match my request
