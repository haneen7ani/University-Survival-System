Feature: Anime Gamification

  Scenario: Earn an anime badge for completing study milestones
    Given the student completes 5 study tasks in a single week
    When the progress is logged into the gamification engine
    Then the student should unlock an anime avatar badge
    And the student should see a celebratory achievement popup

  Scenario: View gamified leaderboard rank
    Given the student has earned anime XP points from academic activities
    When the student checks the "Leaderboard" tab
    Then the system should display their rank among university peers
