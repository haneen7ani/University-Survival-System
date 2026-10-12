
Feature: University Guide
  As a student
  I want to access the university guide
  So that I can find useful information about the university

  Scenario: View university information
    Given the student is logged in
    When the student opens the university guide
    Then the system should display general university information

  Scenario: View university facilities
    Given the student is viewing the university guide
    When the student opens the facilities section
    Then the system should display information about university facilities

  Scenario: Find university departments
    Given the student is viewing the university guide
    When the student opens the departments section
    Then the system should display the available university departments

  Scenario: View campus locations
    Given the student is viewing the university guide
    When the student opens the campus locations section
    Then the system should display campus locations and relevant directions
