Feature: University Frequently Asked Questions

  As a university student
  I want to access frequently asked questions
  So that I can quickly find answers about university procedures

  Scenario: View FAQ categories
    Given the student opens the University FAQ
    When the FAQ page is displayed
    Then the system should display available FAQ categories

  Scenario: Search for a question
    Given the student is viewing the FAQ section
    When the student searches for a question
    Then the system should display relevant answers

  Scenario: View an FAQ answer
    Given the student selects a frequently asked question
    When the question is opened
    Then the system should display the answer
    And display any relevant instructions

  Scenario: No matching FAQ found
    Given the student searches for a question
    And no matching question exists
    When the search is completed
    Then the system should inform the student that no answer was found
