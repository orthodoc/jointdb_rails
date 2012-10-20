Feature: Editing companies
  As a user
  I want to update company information

  Background: 
    Given there is a company listed
    And I am on the homepage

  Scenario: Updating company without logging in
    Given I am not logged in
    When I follow the company
    Then I should not see the edit link for the company

  Scenario: Updating company after logging in
    Given I am logged in
    When I follow the company
    Then I should see the edit link for the company
    And I follow the edit link for the company
    And I make the changes in the company form
    Then I should see the updated page for the company
    And I should see a successful update message
