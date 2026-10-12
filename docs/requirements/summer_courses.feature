Feature: Summer Courses

  As a university student
  I want to view and register for available summer courses
  So that I can complete required courses during the summer

  Scenario: View available summer courses
    Given the student opens the Summer Courses section
    When available summer courses are loaded
    Then the system should display the available courses
    And display the course name
    And display the credit hours
    And display the registration status

  Scenario: Check course eligibility
    Given the student selects a summer course
    When the system checks the student's academic record
    Then the system should determine whether the student is eligible to register

  Scenario: Register for an eligible summer course
    Given the student is eligible for a summer course
    And registration is available
    When the student registers for the course
    Then the system should confirm the registration

  Scenario: Course is full
    Given the student selects a summer course
    And the course has reached its maximum capacity
    When the student tries to register
    Then the system should inform the student that the course is full
