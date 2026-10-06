Feature: University Guide

  Scenario: Student searches for a university service

    Given the university has published service information
    When the student searches for "Student Affairs"
    Then the system should display the matching service
    And show its location and working hours
