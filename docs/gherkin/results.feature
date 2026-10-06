Feature: Academic Results

  Scenario: Student views academic results

    Given the student's results have been published
    When the student opens Academic Results
    Then the system should display the student's results
    And show the corresponding grades
