Feature: Deleting companies
  As an admin
  I want to be able to delete a company

  Background:
    Given I exist as a user
    And I am logged in
    And there is a company listed
    And I am on the homepage
    And I follow the company


  Scenario: Deleting a company by a user
    Then I should not see the delete link for the company

  Scenario: Delete a company by admin
    Given I exist as an admin
    Then I should see the delete link for the company
    And I follow the delete link for the company
    Then I should see a successful delete message for the company
    And I should not see the deleted company
