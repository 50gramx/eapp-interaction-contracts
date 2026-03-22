Feature: icalc
  # As a User, I want to Intuitive Function Buttons so that 

  @EAIC1024 @EAIC1025 @EAIC1026 @EAIC1027 @EAIT1002 @EALC1001 @EAIP1001
  Scenario: Intuitive Function Buttons
    Given I am on the Main Page of the ioscalc app
    When I look for the function buttons
    When I see options like addition, subtraction, multiplication, and division clearly labeled
    Then I can perform calculations quickly and accurately
