Feature: Academic Results

  Scenario: View academic results for current semester
    Given the final grades have been published by the administration
    When the student clicks on "Academic Results"
    Then the student should see grades for each completed course
    And the system should show the semester GPA and total credits earned

  Scenario: View detailed grade breakdown for a specific course
    Given the student is viewing the results page
    When the student expands a course row
    Then the student should see individual assignment, midterm, and final exam scores
