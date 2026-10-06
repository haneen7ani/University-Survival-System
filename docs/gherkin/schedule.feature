Feature: Academic Schedule

  Scenario: Student views weekly schedule

    Given the student's schedule is available
    When the student opens the Schedule
    Then the system should display the student's classes
    And show their dates, times, and locations
