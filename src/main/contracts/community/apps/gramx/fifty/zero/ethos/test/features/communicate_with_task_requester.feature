Feature: test
  # As an Unskilled Labor Provider named Ramesh Kumar, I want to communicate with task requesters directly through the app so that I can clarify job details and confirm arrangements.

  @EAIV1014 @EAIV1015 @EALC1006 @EALC1007 @EAIC1016 @EAIC1017 @EAIT1003 @EAIP1001
  Scenario: Communicate with Task Requester
    Given I have applied for a job posted by a task requester
    When I click on the 'Message' button on the job listing
    When I send my message to the requester
    Then I should receive a notification if they respond
    Then I should be able to view the conversation thread in my profile
