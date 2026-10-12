Feature: GPA & Academic Progress

  Scenario: View cumulative GPA and credit hours progress
    Given the student is logged in
    When the student opens the "Academic Progress" section
    Then the student should see their current overall GPA
    And the student should see total earned credit hours versus required hours

  Scenario: Simulate GPA calculation for upcoming semester
    Given the student is on the GPA calculator page
    When the student enters estimated grades for current courses
    And the student clicks "Calculate Estimated GPA"
    Then the system should display the predicted target GPA
