Feature: Company and associated products
  As a user
  I want to see each company

  Scenario: Seeing each company
    Given I am logged in
    When I visit the company page
    Then I should see the company name
    And I should see the list of products belonging to that company

  Scenario: Searching for a product
    Given I am on the company page
    When I search for a partial product word
    Then I should see the list of products matching that partial word

  Scenario: Searching for non-existent product
    When I search for a non-existent product
    Then I should not see the non-existent product
    And I should see an unsuccesful product search message
