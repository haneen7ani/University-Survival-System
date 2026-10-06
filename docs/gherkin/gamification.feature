Feature: Anime Gamification

  Scenario: Student completes a rewarded task

    Given the student has a task that provides XP
    When the student completes the task
    Then the system should verify the completion
    And award the configured XP
    And update the student's progress
