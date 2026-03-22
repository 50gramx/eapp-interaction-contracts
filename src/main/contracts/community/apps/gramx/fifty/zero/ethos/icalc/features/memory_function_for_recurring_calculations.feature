Feature: ioscalc
  # As a professional named Michael Smith, I want to use the memory function to store a recurring calculation so that I can easily recall it for future reports.

  @EAIV1009 @EALC1002 @EAIC1013 @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EAIV1005 @EAIV1006 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1011 @EAIC1003 @EAIC1012 @EAIC1005 @EAIT1001
  Scenario: Memory Function for Recurring Calculations
    Given I am on the Main Page of the ioscalc app
    When I perform a calculation '1000' multiplied by '1.05'
    When I press the 'memory save' button
    Then the result '1050' should be saved in memory
