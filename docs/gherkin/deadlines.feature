Feature: Academic Notifications

  Scenario: Student receives a deadline notification

    Given an official academic deadline has been added
    And the student is affected by that deadline
    When the deadline approaches
    Then the system should notify the student
