Feature: Academic Registration

  Scenario: Student submits course registration

    Given the registration period is open
    And the student is eligible to register
    When the student selects eligible courses
    And submits the registration form
    Then the system should create a registration request
    And set its status to "Pending"
