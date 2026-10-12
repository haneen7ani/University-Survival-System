
Feature: Study Planner
  As a student
  I want to create and manage personal study plans
  So that I can organize my study tasks and track my progress

  Scenario: Create a study plan
    Given the student is logged in
    When the student creates a personal study plan
    Then the system should save the study plan

  Scenario: Organize study tasks
    Given the student has created a study plan
    When the student adds study tasks
    Then the system should organize tasks by course and deadline

  Scenario: Track study progress
    Given the student has a study plan with tasks
    When the student marks a task as completed
    Then the system should update the study progress
    And the system should show the completed tasks
