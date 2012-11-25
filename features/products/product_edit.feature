Feature: Editing products
  As a user
  I want to update product information

  Background:
    Given there is a product listed
    And I am on the product page

  Scenario: Update product without logging in
    Given I am not logged in
    Then I should not see the edit link for the product

  Scenario: Updating product after logging in
    Given I am logged in
    Then I should see the edit link for the product
    When I follow the edit link for the product
    And I make changes in the product form
    Then I should see the updated page for the product
    And I should see a successful update message
