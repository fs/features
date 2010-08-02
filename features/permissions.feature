Feature: As a developer
  I would like to check how permissions are working in the project

  Scenario: Visitor should not be able to create features
    When I am on the new feature page
    Then access should be denied by authentication
    When I send "POST" request to the features page
    Then access should be denied by authentication

  Scenario: Visitor should not be able to update features
    Given a user: "user" exists
    And a feature: "feature" exists with user: user "user", id: 1
    When I am on the edit feature page with id: 1
    Then access should be denied by authentication
    When I send "PUT" request to the feature page with id: 1
    Then access should be denied by authentication

  Scenario: Authentificated user without admin role should not be able to update features not owned by him
    Given I am logged in as "me@timurv.ru/123456"
    And a user: "user" exists
    And a feature: "feature" exists with user: user "user", id: 1
    When I am on the edit feature page with id: 1
    Then access should be denied by authorization
    When I send "PUT" request to the feature page with id: 1
    Then access should be denied by authorization

  Scenario: Authentificated user without admin role should not be able to approve features
    Given I am logged in as "me@timurv.ru/123456"
    And a user: "user" exists
    And a feature: "feature" exists with user: user "user", approved: false, id: 1
    When I send "PUT" request to the approve feature page with id: 1
    Then access should be denied by authorization

  Scenario: Authentificated user without admin role should not be able to unapprove features
    Given I am logged in as "me@timurv.ru/123456"
    And a user: "user" exists
    And a feature: "feature" exists with user: user "user", approved: true, id: 1
    When I send "PUT" request to the unapprove feature page with id: 1
    Then access should be denied by authorization

  Scenario: Visitor should not be able to manage tags
    When I am on the tags page
    Then access should be denied by authentication

  Scenario: Visitor should not be able to update tags
    Given a tag: "tag" exists with name: "Tag", id: 1
    When I am on the edit tag page with id: 1
    Then access should be denied by authentication
    When I send "PUT" request to the tag page with id: 1
    Then access should be denied by authentication

  Scenario: Authentificated user without admin role should not be able to manage tags
    Given I am logged in as "me@timurv.ru/123456"
    When I am on the tags page
    Then access should be denied by authorization

  Scenario: Authentificated user without admin role should not be able to update tags
    Given I am logged in as "me@timurv.ru/123456"
    And a tag: "tag" exists with name: "Tag", id: 1
    When I am on the edit tag page with id: 1
    Then access should be denied by authorization
    When I send "PUT" request to the tag page with id: 1
    Then access should be denied by authorization
