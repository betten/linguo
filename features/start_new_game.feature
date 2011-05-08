Feature: Start a new game
  In order to play linguo
  As a user should be able to signin, pick a language, and start a game

  Scenario: Signin
    Given I am an anonymous user
    And I am on the landing page
    When I signin
    Then I should be redirected to my games page

  Scenario: Signed in
    Given I am logged in
    And I am on my games page
    When I select new game
    Then I should see a list of games

  Scenario: New game
    Given I am logged in
    And I am on the list of languages page
    When I select a language
    Then I should see the new game page

  Scenario: Gameplay
    Given I am logged in
    And I am on a game page

