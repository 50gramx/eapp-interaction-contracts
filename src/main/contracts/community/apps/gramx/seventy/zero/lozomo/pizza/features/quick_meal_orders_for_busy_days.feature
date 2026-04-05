Feature: localzomatoforhsr
  # As a Busy Professional named Amit Sharma, I want to filter food options based on delivery time so that I can quickly order meals during my breaks at work.

  @EAIV1005 @EAIV1006 @EAIC1005 @EALC1001 @EAIP1001 @EAIC1002 @EAIT1001
  Scenario: Quick Meal Orders for Busy Days
    Given I am on the Main Page of the localzomatoforhsr app
    When I select a filter for 'Delivery Time'
    Then I should see food options that can be delivered within my selected timeframe
