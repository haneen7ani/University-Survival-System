Feature: Courses & Prerequisites

  Scenario: View course details and prerequisites successfully
    Given the student is logged in
    And the student navigates to the course catalog
    When the student clicks on a specific course
    Then the system should display the course description
    And the student should see the list of prerequisite courses required

  Scenario: Student views a course with unsatisfied prerequisites
    Given the student has not passed "Intro to Programming"
    When the student views "Advanced Data Structures"
    Then the system should show a warning message saying "Prerequisites not met"
    And the enrollment button should be disabled
