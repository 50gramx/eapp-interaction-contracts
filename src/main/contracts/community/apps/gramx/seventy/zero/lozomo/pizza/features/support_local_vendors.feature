Feature: localzomatoforhsr
  # As a Local Food Enthusiast named Riya Kumar, I want to see a list of local vendors so that I can support them and promote their offerings.

  @EAIV1002 @EAIV1003 @EALC1002 @EAIC1003 @EAIP1001 @EAIC1002 @EAIT1001
  Scenario: Support Local Vendors
    Given I am on the Main Page of the localzomatoforhsr app
    When I click on the 'Local Vendors' tab
    Then I should see a list of local vendors along with their specialties
