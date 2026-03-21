Feature: helloethos
  # As a casual user named Alice Johnson, I want to see a simple 'Hello World' greeting on the main page so that I can quickly view a welcoming message without any distractions.

  @EAIV1001 @EAIP1001 @EAIC1001 @EAIT1001
  Scenario: Simple Greeting Display for Casual User
    Given I have opened the helloethos app
    When I navigate to the main page
    Then I should see 'Hello World' displayed prominently on the screen
