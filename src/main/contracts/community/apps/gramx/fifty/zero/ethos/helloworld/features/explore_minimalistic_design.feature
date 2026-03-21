Feature: helloworld
  # As a tech enthusiast named Linda Carter, I want to explore the app's minimalist design on the Main Page so that I can appreciate its simplicity and learn from it.

  @EAIC1002 @EAIV1001 @EAIP1001
  Scenario: Explore Minimalistic Design
    Given I have downloaded the helloworld app
    When I open the app
    And I look at the layout and elements on the Main Page
    Then I should notice a clean interface with no unnecessary elements
    And the text 'hello' should be clearly visible
