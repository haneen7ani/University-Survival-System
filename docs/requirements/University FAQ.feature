Feature: University FAQ

  Scenario: Search for answers in the FAQ database
    Given the student is on the FAQ page
    When the student types "How to request a transcript?" in the search bar
    Then the system should show matching FAQ questions
    And expanding a question should reveal the detailed answer step-by-step
