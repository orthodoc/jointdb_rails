Feature: Show the category and associated companies
  As an admin
  I want to see each category

  Scenario: Seeing each category
    Given I am logged in as an admin
    When I visit the category page
    Then I should see the category name
    And I should see the companies belonging to that category
