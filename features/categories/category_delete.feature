Feature: Deleting categories
  As an admin
  I want to be able to delete a category

  Scenario:
    Given I am logged in as an admin
    And I am on the categories page
    When I follow the category
    Then I should see the delete link for the category
    And I follow the delete link for the category
    Then I should see a successful category delete message
    And I should not see the deleted category
