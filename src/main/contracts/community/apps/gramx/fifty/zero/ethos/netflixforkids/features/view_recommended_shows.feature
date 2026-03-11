Feature: netflixforkids
  # As a child named Liam Rodriguez, I want to see recommended shows based on my favorites so that I can discover new adventures.

  @EAIC1007 @EAIC1008 @EAIV1003 @EAIV1004 @EAIV1005 @EAIV1006 @EALC1002 @EALC1003 @EAIP1001 @EAIC1004
  Scenario: View Recommended Shows
    Given I am on the Main Page of the netflixforkids app
    When I scroll to the 'Recommended for You' section
    Then I should see a list of shows that are tailored to my viewing history
    And each recommendation should include a 'Watch Now' button
