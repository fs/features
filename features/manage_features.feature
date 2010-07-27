Feature: Manage features
  As a manager
  I want to be able to manage features

  Scenario: Listing features
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Sign in"
    And a feature exists with name: "Sign out"
    And I am on the features page
    Then I should see "Sign in"
    And I should see "Sign out"

  Scenario: Create new feature with valid data
    Given I am logged in as "me@timurv.ru/123456"
    And I am on the new feature page
    When I fill in "Name" with "Sign in"
    And I fill in "Feature" with "Cucumber feature"
    And I fill in "Est" with "1"
    And I fill in "Description" with "Some tech description"
    And I press "Create"
    Then I should be on the features page
    And I should see "Feature was successfully created."
    And a feature should exist with name: "Sign in"

  Scenario: Create new feature with invalid data
    Given I am logged in as "me@timurv.ru/123456"
    And I am on the new feature page
    When I fill in "Name" with "Feature name"
    And I fill in "Est" with ""
    And I press "Create"
    Then a feature should not exist with name: "Feature name"

  Scenario: Update feature with valid data
    Given I am logged in as "me@timurv.ru/123456"
    And a feature: "sign_in" exists with name: "Sign in", id: 1
    And I am on the edit feature page with id: 1
    And I fill in "Name" with "New feature name"
    And I press "Update Feature"
    Then I should be on the features page
    And I should see "Feature was successfully updated."
    And a feature: "sign_in" should exist with name: "New feature name"

  Scenario: Update feature with invalid data
    Given I am logged in as "me@timurv.ru/123456"
    And a feature: "sign_in" exists with name: "Sign in", id: 1
    And I am on the edit feature page with id: 1
    And I fill in "Name" with "New feature name"
    And I fill in "Est" with ""
    And I press "Update Feature"
    And a feature: "sign_in" should exist with name: "Sign in"
