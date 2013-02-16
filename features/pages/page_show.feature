Feature: Viewing a particular page
  As a user
  I want to see the contents of the page

  Scenario: Viewing each page
    Given I am visiting a particular page
    Then I should see the name of the page
    And I should see the contents of the page

  Scenario: Viewing a non-existent page
    Given I visit a non-existent page
    Then I should be redirected to the home page
    And I should see a non-existent page message
