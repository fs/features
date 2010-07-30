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

