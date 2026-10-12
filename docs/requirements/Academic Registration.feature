Feature: Academic Registration

  Scenario: Register for courses successfully
    Given the registration period is open
    And the student has selected courses meeting all prerequisites
    When the student clicks "Submit Registration"
    Then the courses should be registered successfully
    And the student should see a confirmation message with total credits registered

  Scenario: Try to register for conflicting course times
    Given the student selects two courses scheduled at the same time slot
    When the student clicks "Submit Registration"
    Then the system should reject the submission
    And the student should see an error message saying "Time conflict detected"

  Scenario: Try to register for a course that is full
    Given the course "Database Systems" has 0 available seats
    When the student attempts to add "Database Systems"
    Then the course should not be added to the registration list
    And the student should see a message saying "Course section is full"
