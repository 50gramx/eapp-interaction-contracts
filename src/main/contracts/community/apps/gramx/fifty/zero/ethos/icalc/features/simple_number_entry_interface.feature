Feature: icalc
  # As a finance professional named Michael Smith, I want to have clear number entry buttons so that I can enter numbers smoothly during calculations.

  @EAIC1016 @EAIC1017 @EAIC1018 @EAIC1019 @EAIC1020 @EAIC1021 @EAIC1022 @EAIC1023 @EAIC1024 @EAIC1025 @EALC1003 @EAIP1001 @EAIT1001
  Scenario: Simple Number Entry Interface
    Given I am on the Main Page of the ioscalc app
    When I look at the number entry section
    When I see the buttons numbered 0-9 displayed clearly
    Then I can enter numbers smoothly and efficiently
