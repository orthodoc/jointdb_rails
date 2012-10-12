Feature: Create a company
  As an authenticated user
  I want to create companies easily

  Background: 
    Given I am on the homepage
    And I am logged in

  Scenario: Creating a company
    When I add a new company that belongs to a category
    Then I should see the page for the newly created company
    And I should see the company name
    And I should see the category name
    And I should see a successful flash notice
