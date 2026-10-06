Feature: GPA Calculation

  Scenario: Student calculates semester GPA

    Given the student has entered their course grades
    When the student requests GPA calculation
    Then the system should calculate the semester GPA
    And display the result
