Feature: Editing categories 
  As an admin
  I want to update category information

  Background:
    Given there is a category listed
    And I am on the categories page

  Scenario: Updating company as a user
    Given I exist as a user
    And I am logged in
    When I visit the categories page
    Then I should see an admin flash message

    Scenario: Updating category as an admin
    Given I exist as an admin
    And I am logged in as an admin
    When I follow the category
    Then I should see the edit link for the category
    And I follow the edit link for the category
    And I make changes in the category form
    Then I should see the updated page for the category
    And I should see a successful update message
