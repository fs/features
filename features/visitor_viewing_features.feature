Feature: Viewing features by visitor
  As an unauthorized user
  I want to be able to view features

  Scenario: Listing features
    Given a feature exists with name: "Sign in"
    And a feature exists with name: "Sign out"
    And I am on the features page
    Then I should see "Sign in"
    And I should see "Sign out"

  Scenario: Searching features
    Given a feature exists with name: "Rails 3 skeleton"
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
    Given a feature exists with name: "Sign in", tag_list: "rails, auth"
    And a feature exists with name: "Scaffold", tag_list: "rails"
    When I am on the features page
    Then I should see "auth"
    When I follow "auth"
    Then I should see "Sign in"
    And I should not see "Scaffold"

  Scenario: Viewing feature
    Given a feature exists with name: "Sign in", id: 1
    When I am on the feature page with id: 1
    Then I should see "Sign in"