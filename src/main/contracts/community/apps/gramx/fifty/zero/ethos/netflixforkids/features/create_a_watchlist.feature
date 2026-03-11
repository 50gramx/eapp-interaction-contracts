Feature: netflixforkids
  # As a teacher named Mike Anderson, I want to create a watchlist of shows so that I can organize content that supports my lesson plans.

  @EAIV1005 @EAIV1006 @EALC1003 @EALC1004 @EAIC1005 @EAIC1006 @EAIP1001
  Scenario: Create a Watchlist
    Given I have found a show I like on the Details Page
    When I click the 'Add to Watchlist' button
    Then the show should be added to my Watchlist
    And I should receive a confirmation message saying 'Show added to Watchlist'
