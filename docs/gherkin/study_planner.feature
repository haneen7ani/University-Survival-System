Feature: Study Planner

  Scenario: Student creates a study task

    Given the student is viewing the Study Planner
    When the student creates a task with a date and priority
    Then the system should save the task
    And display it in the student's planner
