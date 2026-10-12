
Feature: Deadlines and Notifications
  As a student
  I want to view deadlines and receive notifications
  So that I can keep track of important academic tasks

  Scenario: View upcoming deadlines
    Given the student is logged in
    When the student opens the deadlines page
    Then the system should display upcoming academic deadlines

  Scenario: Receive deadline notifications
    Given the student is logged in
    And the student has an upcoming academic deadline
    When the deadline notification is triggered
    Then the system should notify the student about the upcoming deadline

  Scenario: View notifications
    Given the student is logged in
    When the student opens the notifications page
    Then the system should display the student's notifications

  Scenario: View deadline details
    Given the student is viewing upcoming deadlines
    When the student selects a deadline
    Then the system should display the deadline details and due date
