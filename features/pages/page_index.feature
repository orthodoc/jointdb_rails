Feature: List Pages
  As an admin
  I want to manage the list of pages

  Background:
    When I am on the pages page

  Scenario: Viewing the list of pages
    Given I am logged in as an admin
    Then I should see a list of pages
    And I should see Show, Edit and Destroy

  Scenario: Viewing list of pages as a user
    Given I am logged in
    Then I should see an admin flash message
    And I should be on the home page
    And I should not see Show, Edit and Destroy
