Feature: Manage features by admin
  As a administrator
  I want to be able to manage features

  Scenario: Listing features
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And a feature exists with name: "Feature 1", approved: true
    And a feature exists with name: "Feature 2", approved: false
    And I am on the features page
    Then I should see "Feature 1"
    And I should not see "Feature 2"
    And I should see "Edit"
    And I should see "Destroy"

  Scenario: Listing unapproved features
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And a feature exists with name: "Feature 1", approved: true
    And a feature exists with name: "Feature 2", approved: false
    And I am on the unapproved features page
    Then I should not see "Feature 1"
    And I should see "Feature 2"
    And I should see "Edit"
    And I should see "Destroy"

  Scenario: Searching features
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And a feature exists with name: "Rails 3 skeleton"
    And a feature exists with name: "Scaffold"
    And I am on the features page
    When I fill in "search_query" with "scaffold"
    And I press "Search"
    Then the "search_query" field should contain "scaffold"
    And I should see "Scaffold"
    And I should not see "Rails 3 skeleton"
    When I fill in "search_query" with "Rails"
    And I press "Search"
    Then the "search_query" field should contain "Rails"
    And I should see "Rails"
    And I should not see "Skeleton"

  Scenario: Listing features by tags
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And a feature exists with name: "Sign in", tag_list: "rails, auth"
    And a feature exists with name: "Scaffold", tag_list: "rails"
    When I am on the features page
    Then I should see "auth"
    When I follow "auth"
    Then I should see "Sign in"
    And I should not see "Scaffold"

  Scenario: Viewing feature
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And a feature exists with name: "Sign in", id: 1
    When I am on the feature page with id: 1
    Then I should see "Sign in"
    And I should see "Edit"

  Scenario: Approving feature
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And a feature: "feature" exists with name: "Sign in", approved: "false", id: 1
    When I am on the feature page with id: 1
    Then I should see "Approve!"
    When I follow "Approve!"
    Then I should be on the features page
    And I should see "Feature was approved."
    And a feature: "feature" should exist with approved: true

  Scenario: Unapproving feature
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And a feature: "feature" exists with name: "Sign in", approved: "true", id: 1
    When I am on the feature page with id: 1
    Then I should see "Unapprove!"
    When I follow "Unapprove!"
    Then I should be on the features page
    And I should see "Feature was unapproved."
    And a feature: "feature" should exist with approved: false

  Scenario: Create new feature with valid data
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
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
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And I am on the new feature page
    When I fill in "Name" with "Feature name"
    And I fill in "Est" with ""
    And I press "Create"
    Then a feature should not exist with name: "Feature name"

  Scenario: Update feature with valid data
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And a feature: "sign_in" exists with name: "Sign in", id: 1
    And I am on the edit feature page with id: 1
    And I fill in "Name" with "New feature name"
    And I press "Update Feature"
    Then I should be on the features page
    And I should see "Feature was successfully updated."
    And a feature: "sign_in" should exist with name: "New feature name"

  Scenario: Update feature with invalid data
    Given I am logged in as "me@timurv.ru/123456" with "admin" role
    And a feature: "sign_in" exists with name: "Sign in", id: 1
    And I am on the edit feature page with id: 1
    And I fill in "Name" with "New feature name"
    And I fill in "Est" with ""
    And I press "Update Feature"
    And a feature: "sign_in" should exist with name: "Sign in"
