Feature: Create a product
  As an authenticated user
  I want to add products to a company

  Background:
    Given I am on a company page
    And I am logged in

  Scenario: Adding a product
    When I add a new product that belongs to a company
    Then I should see the page for the newly created product
    And I should see the product name
    And I should see the company name to which the product belongs to
    And I should see a successful flash notice
    When I click on the company name
    Then I am on the company page
