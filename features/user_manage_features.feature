Feature: Manage features by authontificated user
  As a registered user
  I want to be able to manage features

  Scenario: Listing all features
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Feature 1"
    And I am on the features page
    Then I should see "Feature 1"
    And I should not see "Edit"
    And I should not see "Destroy"

  Scenario: Listing features belongs to current user
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Feature 1", user: user "current_user"
    And I am on the features page
    Then I should see "Feature 1"
    And I should not see "Edit"
    And I should not see "Destroy"

  Scenario: Listing unapproved features
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Feature 1", approved: false
    And I am on the unapproved features page
    Then I should see "Feature 1"
    And I should not see "Edit"
    And I should not see "Destroy"

  Scenario: Listing unapproved features belongs to current user
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Feature 1", approved: false, user: user "current_user"
    And I am on the unapproved features page
    Then I should see "Feature 1"
    And I should see "Edit"
    And I should see "Destroy"

  Scenario: Searching features
    Given I am logged in as "me@timurv.ru/123456"
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
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Rails 3", tag_list: "rails, auth"
    And a feature exists with name: "Scaffold", tag_list: "rails"
    When I am on the features page
    Then I should see "auth"
    When I follow "auth"
    Then I should see "Feature"
    And I should not see "Scaffold"

  Scenario: Viewing approved feature
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Scaffold", id: 1
    When I am on the feature page with id: 1
    Then I should see "Scaffold"
    And I should not see "Edit"

  Scenario: Viewing approved feature belongs to current user
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Scaffold", user: user "current_user", id: 1
    When I am on the feature page with id: 1
    Then I should see "Scaffold"
    And I should not see "Edit"

  Scenario: Viewing unapproved feature
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Scaffold", approved: false, id: 1
    When I am on the feature page with id: 1
    Then I should see "Scaffold"
    And I should not see "Edit"
    And I should not see "Approve"

  Scenario: Viewing unapproved feature belongs to current user
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Scaffold", approved: false, user: user "current_user", id: 1
    When I am on the feature page with id: 1
    Then I should see "Scaffold"
    And I should see "Edit"
    And I should not see "Approve"

  Scenario: Create new unapproved feature with valid data
    Given I am logged in as "me@timurv.ru/123456"
    And I am on the new feature page
    When I fill in "Name" with "Sign in"
    And I fill in "Feature" with "Cucumber feature"
    And I fill in "Est" with "1"
    And I fill in "Description" with "Some tech description"
    And I press "Create"
    Then I should be on the features page
    And I should see "Feature was successfully created."
    And a feature should exist with name: "Sign in", approved: false, user: user "current_user"

  Scenario: Create new unapproved feature with invalid data
    Given I am logged in as "me@timurv.ru/123456"
    And I am on the new feature page
    When I fill in "Name" with "Feature name"
    And I fill in "Est" with ""
    And I press "Create"
    Then a feature should not exist with name: "Feature name"

  Scenario: Update unapproved feature with valid data belongs to current user
    Given I am logged in as "me@timurv.ru/123456"
    And a feature: "sign_in" exists with name: "Sign in", approved: false, user: user "current_user", id: 1
    And I am on the edit feature page with id: 1
    And I fill in "Name" with "New feature name"
    And I press "Update Feature"
    Then I should be on the features page
    And I should see "Feature was successfully updated."
    And a feature: "sign_in" should exist with name: "New feature name"

  Scenario: Update unapproved feature with invalid data belongs to current user
    Given I am logged in as "me@timurv.ru/123456"
    And a feature: "sign_in" exists with name: "Sign in", approved: false, user: user "current_user", id: 1
    And I am on the edit feature page with id: 1
    And I fill in "Name" with "New feature name"
    And I fill in "Est" with ""
    And I press "Update Feature"
    And a feature: "sign_in" should exist with name: "Sign in"
