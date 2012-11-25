Feature: Product list
  As a user
  I want to see the list of products

  Background:
    Given I am logged in
    And I am on the products page

  Scenario: Viewing a list of products
    Then I should see the list of products

  Scenario: Searching for a product
    When I search for a partial word
    Then I should see a list of products matching that partial word

  Scenario: Searching for a non-existent product
    When I search for a non-existent product
    Then I should not see the non-existent product
    And I should see an unsuccesful product seach message
