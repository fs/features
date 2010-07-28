Feature: Manage tags
  As a manager
  I want to be able to manage tags

  Scenario: Listing tags
    Given I am logged in as "me@timurv.ru/123456"
    And a feature exists with name: "Sign in", tag_list: "rails, auth"
    And I am on the tags page
    Then I should see "rails"
    And I should see "auth"

  Scenario: Update tag with valid data
    Given I am logged in as "me@timurv.ru/123456"
    And a tag: "tag1" exists with name: "tag1", id: 1
    And I am on the edit tag page with id: 1
    And I fill in "Name" with "New tag name"
    And I press "Update Tag"
    Then I should be on the tags page
    And I should see "Tag was successfully updated."
    And a tag: "tag1" should exist with name: "New tag name"

  Scenario: Update tag with invalid data
    Given I am logged in as "me@timurv.ru/123456"
    And a tag: "tag1" exists with name: "tag1", id: 1
    And I am on the edit tag page with id: 1
    And I fill in "Name" with ""
    And I press "Update Tag"
    And a tag: "tag1" should exist with name: "tag1"
