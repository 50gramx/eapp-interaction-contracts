Feature: icalc
  # As a student named Emily Chen, I want a clean layout with buttons numbered 0-9 so that I can easily perform calculations without distractions.

  @EAIC1014 @EAIC1015 @EAIC1016 @EAIC1017 @EAIC1018 @EAIC1019 @EAIC1020 @EAIC1021 @EAIC1022 @EAIC1023 @EALC1001 @EAIP1001 @EAIT1001
  Scenario: Simple Number Entry Interface
    Given I am on the Main Page of the ioscalc app
    When I look at the number entry section
    When I see the buttons numbered 0-9 displayed clearly
    Then I can enter numbers smoothly and efficiently
