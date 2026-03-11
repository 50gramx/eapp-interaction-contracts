Feature: playhighway
  # As a parent named Sarah Thompson, I want to connect with other parents for recommendations on safe games so that I can share and gain insights on quality gaming options for my children.

  @EAIV1007 @EAIV1008 @EALC1006 @EAIC1013 @EAIC1014 @EAIT1004 @EAIT1005 @EAIP1001
  Scenario: Connect with Other Parents
    Given I have accessed the 'Community Forum' on the Main Page
    When I create a new topic asking for recommendations for children's games
    When I post my query
    Then my topic should be visible to other parents in the forum
    And I should receive notifications when other parents respond
