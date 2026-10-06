Feature: Course Information

  Scenario: Student views course prerequisites

    Given the student is enrolled in a university
    When the student opens a course
    Then the system should display the course credits
    And display its prerequisites
    And show whether the prerequisites have been completed
