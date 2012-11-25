Feature: Deleting products
  As an admin
  I want to be able to delete a product

  Background:
    Given I exist as a user
    And I am logged in
    And there is a product listed
    And I am on the products page
    And I follow the product

  Scenario: Deleting the product by a user
    Then I should not see the delete link for the product

  Scenario: Deleting product by admin
    Given I exist as an admin
    Then I should see the delete link for the product
    When I follow the delete link for the product
    Then I should see a successful delete message for the product
    And I should not see the deleted product
