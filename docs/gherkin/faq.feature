Feature: University FAQ

  Scenario: Student finds an official answer

    Given the university has published an FAQ
    When the student searches for a question
    Then the system should display the relevant official answer
    And show when the information was last updated
