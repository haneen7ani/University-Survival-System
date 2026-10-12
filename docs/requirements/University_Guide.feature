Feature: University Guide

  As a university student
  I want to explore university places and services
  So that I can easily find the facilities I need

  Scenario: View university guide
    Given the student opens the University Guide
    When the guide is displayed
    Then the system should display available university locations and services

  Scenario: View location details
    Given the student selects a university location
    When the location details are opened
    Then the system should display the location name
    And display its description
    And display its available services

  Scenario: Search for a university location
    Given the student is viewing the University Guide
    When the student searches for a location
    Then the system should display matching locations

  Scenario: View important university services
    Given the student opens the University Guide
    When the student selects university services
    Then the system should display available services
    And provide relevant information about each service
