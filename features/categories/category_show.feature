Feature: Show the category and associated companies
  As an admin
  I want to see each category

  Scenario: Seeing each category
    Given I am logged in as an admin
    When I visit the category page
    Then I should see the category name
    And I should see the companies belonging to that category

  Scenario: Searching for a company
    Given I am on the categories page
    When I search for a partial word
    Then I should see the list of companies matching that partial word

  Scenario: Searching for non-existent company
    When I search for a non-existent company
    Then I should not see the non-existent company
    And I should see an unsuccesful search message
