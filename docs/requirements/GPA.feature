Feature: GPA Calculation and Academic Performance

  As a university student
  I want to calculate and track my GPA
  So that I can monitor my academic performance

  Scenario: Calculate GPA for completed courses
    Given the student has completed several courses
    And each course has a grade and credit hours
    When the student requests their GPA
    Then the system should calculate the GPA based on the grades and credit hours
    And display the current GPA to the student

  Scenario: View academic performance
    Given the student has academic results
    When the student opens the GPA section
    Then the system should display the current GPA
    And display the total completed credit hours
    And display the academic standing

  Scenario: Calculate expected GPA
    Given the student enters expected grades for upcoming courses
    When the student requests the expected GPA
    Then the system should calculate the expected GPA
    And display the expected result
