Feature: Company list
  As a user
  I want to see the list of companies

  Background:
    Given I am logged in
    And I am on the companies page

  Scenario: Viewing a list of companies
    Then I should see the list of companies

  Scenario: Searching for a company
    When I search for a partial word
    Then I should the list of companies matching that partial word

  Scenario: Searching for non-existent company
    When I search for a non-existent company
    Then I should not see the non-existent company
    #And I should see an unsuccesful search message
