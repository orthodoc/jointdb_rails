Feature: Create a category
  As an admin
  I want to create categories easily

  Background:
    Given I exist as an admin
    Given I exist as a user
    When I am on the homepage

  Scenario: Creating a category
    Given I am logged in as an admin
    And I add a new category
    Then I should see the page for the newly created category
    And I should see the category name
    And I should see a successful flash notice

  Scenario: Creating a category as a user
    Given I am logged in
    # Given I am logged in as a user
    Then I should not see the new category link
    When I visit new category page
    Then I should see an admin flash message 
    And I should be on the homepage
