Feature: helloworld
  # As an accessibility advocate named Tom Smith, I want to assess the usability of the app's Main Page so that I can ensure it meets the needs of all users, including those with disabilities.

  @EALC1001 @EALC1002 @EAIC1003 @EAIC1004 @EAIC1005 @EAIV1001 @EAIP1001 @EAIC1002
  Scenario: Assess Accessibility for Users
    Given I have opened the helloworld app
    When I use a screen reader to navigate the Main Page
    Then the screen reader should correctly read the text 'hello'
    And I should find navigation elements easy to use and accessible
