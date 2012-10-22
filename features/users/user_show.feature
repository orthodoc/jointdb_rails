Feature: Show Users
  As and admin 
  I want to see the list of registered users

  Background:
    When I look at the list of users

  Scenario: Viewing users as a user
    Given I exist as a user
    And I am logged in
    Then I should not see my name

  Scenario: Viewing users as an admin
    Given I exist as an admin 
    And I am logged in as an admin
    Then I should see my name
