Feature: localzomatoforhsr
  # As a Local Food Enthusiast named Riya Kumar, I want to place an order without commission fees so that I can save money while enjoying my favorite food.

  @EAIV1004 @EAIC1004 @EAIV1002 @EAIV1003 @EALC1001 @EALC1002 @EAIP1001 @EAIC1002 @EAIC1003 @EAIT1001
  Scenario: Avoid Commission Fees
    Given I have selected a restaurant from the list
    When I click on the 'Order Now' button
    Then I should see the total amount without any commission fees
