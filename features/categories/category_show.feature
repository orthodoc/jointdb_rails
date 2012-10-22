Feature: Create a category
  As an admin
  I want to create categories easily

  Background:
    Given I exist as an admin
    And I am logged in as an admin

  Scenario: Creating a category
    When I am on the homepage
    And I add a new category
    Then I should see the page for the newly created category
    And I should see the category name
    And I should see a successful flash notice
