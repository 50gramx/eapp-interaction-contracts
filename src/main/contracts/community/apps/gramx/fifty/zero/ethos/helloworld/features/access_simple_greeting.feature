Feature: helloworld
  # As a casual user named Alex Johnson, I want to see a simple greeting on the Main Page so that I can quickly receive motivation during my busy day.

  @EAIV1001 @EAIP1001 @EAIC1001
  Scenario: Access Simple Greeting
    Given I have launched the helloworld app
    When I navigate to the Main Page
    Then I should see the text 'hello' prominently displayed
