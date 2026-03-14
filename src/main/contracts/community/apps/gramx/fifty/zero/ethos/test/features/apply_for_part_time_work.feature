Feature: test
  # As an Unskilled Labor Provider named Rajesh Patel, I want to apply for suitable part-time work opportunities so that I can supplement my pension and stay socially active without overexerting myself.

  @EAIV1008 @EAIC1008 @EAIC1009 @EAIC1010 @EAIV1001 @EAIV1002 @EALC1002 @EAIP1001
  Scenario: Apply for Part-Time Work
    Given I am on the Main Page of the app
    When I navigate to the 'Available Tasks' section
    When I view tasks that match my skills and preferences
    When I click on the 'Apply' button for a selected task
    Then I should receive a notification if my application is successful
    Then I should see my applied tasks listed in my profile
