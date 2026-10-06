Feature: Student Onboarding

  As a student
  I want to complete my university information
  So that the system can provide relevant academic services

  Scenario: Student completes onboarding successfully

    Given the student has created an account
    When the student selects their university, faculty, department, and academic level
    Then the system should save the student's academic information
    And display the student's dashboard
