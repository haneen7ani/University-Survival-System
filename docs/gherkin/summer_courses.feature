Feature: Summer Courses

  Scenario: Student views eligible summer courses

    Given the student has pending courses
    And summer registration is available
    When the student opens Summer Courses
    Then the system should display available eligible courses
    And show their credit hours
