
Feature: Academic Schedule
  As a student
  I want to view my academic schedule
  So that I can organize my classes

  Scenario: View semester schedule
    Given the student is logged in
    When the student opens the academic schedule page
    Then the system should display the schedule for the selected semester

  Scenario: View course schedule details
    Given the student is viewing the academic schedule
    When the schedule is displayed
    Then the system should show course names, lecture times, dates, and locations

  Scenario: Manage class schedule
    Given the student is viewing the academic schedule
    When the student reviews their schedule
    Then the system should help the student organize their classes
