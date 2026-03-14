Feature: test
  # As a Task Requester named Anita Sharma, I want to review ratings of labor providers before hiring them so that I can ensure the help I receive is reliable and reasonably priced.

  @EAIV1009 @EAIV1010 @EAIV1011 @EAIV1012 @EAIV1013 @EALC1005 @EAIC1011 @EAIC1012 @EAIC1013 @EAIC1014 @EAIC1015 @EAIT1002 @EAIP1001
  Scenario: Review Labor Provider Ratings
    Given I am on the Main Page of the app
    When I click on a labor provider's profile from the list of potential hires
    When I view their ratings and reviews section
    Then I should see the average rating and comments from previous clients
    Then I should be able to make an informed decision based on the feedback
