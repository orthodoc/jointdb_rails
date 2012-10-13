Feature: Editing companies
  As a user
  I want to update company information

  Background:
    Given there is a company listed
    And I am on the homepage
    And I follow the company
    And I follow the edit link for the company

  Scenario: Updating a company
    When I make the changes in the company form
    Then I should see the updated page for the company
    And I should see a successful update message
