
Feature: Summer Courses
  As a student
  I want to explore available summer courses
  So that I can plan my summer registration

  Scenario: View available summer courses
    Given the student is logged in
    When the student opens the summer courses page
    Then the system should display the available summer courses

  Scenario: View summer course details
    Given the student is viewing available summer courses
    When the student selects a summer course
    Then the system should display the course details and prerequisites

  Scenario: Plan summer registration
    Given the student is viewing available summer courses
    When the student reviews course details and prerequisites
    Then the system should help the student plan their summer registration
