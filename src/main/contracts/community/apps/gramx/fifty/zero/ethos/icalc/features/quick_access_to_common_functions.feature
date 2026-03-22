Feature: icalc
  # As a dedicated engineering student named Emily Chen, I want quick access to common functions like addition, subtraction, multiplication, and division on the Main Page so that I can perform calculations without delay during my study sessions.

  @EALC1001 @EAIP1001 @EAIC1024 @EAIC1025 @EAIC1026 @EAIC1027 @EAIT1002
  Scenario: Quick Access to Common Functions
    Given I am on the Main Page of the ioscalc app
    When I look for the function buttons
    When I see options like addition, subtraction, multiplication, and division clearly labeled
    Then I can perform calculations quickly and efficiently
