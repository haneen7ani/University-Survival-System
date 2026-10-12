Feature: Authentication & Onboarding

  Scenario: User registers with valid details successfully
    Given the user is on the signup page
    And the user enters valid credentials
    When the user clicks "Sign Up"
    Then an account should be created successfully
    And the user should be redirected to the onboarding setup

  Scenario: User tries to register with an already existing email
    Given the user is on the signup page
    And the user enters an email that is already registered
    When the user clicks "Sign Up"
    Then the system should show an error message saying "Email already in use"
    And the account should not be created

  Scenario: User completes onboarding process
    Given the user is logged in for the first time
    When the user completes the profile setup steps
    Then the user should see a welcome dashboard
    And the user profile status should be updated to completed
