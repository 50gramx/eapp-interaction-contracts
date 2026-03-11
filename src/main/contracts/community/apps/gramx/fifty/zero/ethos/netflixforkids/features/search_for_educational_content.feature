Feature: netflixforkids
  # As a parent named Jessica Thompson, I want to search for educational shows so that I can find high-quality content for my kids.

  @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EALC1001 @EALC1002 @EAIP1001 @EAIC1001 @EAIC1002 @EAIC1003 @EAIC1004
  Scenario: Search for Educational Content
    Given I am on the Main Page of the netflixforkids app
    When I enter 'educational' in the search bar
    When I click the Search Button
    Then I should see a list of shows that are categorized as educational
    And each show should have age-appropriate labels
