Feature: netflixforkids
  # As a teacher named Mike Anderson, I want to facilitate discussions based on show content so that I can engage my students in interactive learning.

  @EAIV1010 @EAIV1011 @EALC1006 @EAIP1003 @EAIC1011 @EAIC1012 @EAIC1013
  Scenario: Interactive Learning Discussions
    Given I am on the Details Page of an educational show
    When I click on the 'Discussion Questions' section
    Then I should see a list of questions to discuss with my students
    And I should be able to save these questions for future reference
