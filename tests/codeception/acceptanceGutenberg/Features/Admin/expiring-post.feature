Feature: Expiring post in the Gutenberg editor
  In order to control the post expiration of a post in the Gutenberg editor
  As an admin
  I need to be able to configure a post to expire or not using the component panel

  Background:
    Given the user "admin_user" exists with role "administrator"
    And I am logged in as "admin_user"

  Scenario: See the Gutenberg metabox
    When I am adding a new post
    Then I see the component panel "PublishPress Future"

  # When default expiration is not activated for post

  Scenario: When default expiration is not activated for post, the Enable Post Expiration checkbox should be unchecked by default for a new post
    Given default expiration is not activated for "post"
    When I am adding a new post
    Then the checkbox Enable Post Expiration is deactivated on the component panel

  Scenario: When default expiration is not activated for post, I can enable it for a new post
    Given default expiration is not activated for "post"
    When I am adding a new post with title "Post A" on Gutenberg
    And I check the Enable Post Expiration checkbox on Gutenberg
    And I save the post on Gutenberg
    Then the checkbox Enable Post Expiration is activated on the component panel

  Scenario: When default expiration is not activated for post, I can enable it for an existent post
    Given default expiration is not activated for "post"
    And post "post_2" exists
    And I am editing post "post_2"
    And I check the Enable Post Expiration checkbox on Gutenberg
    And I save the post on Gutenberg
    Then the checkbox Enable Post Expiration is activated on the component panel

  # When default expiration is activated for post

  Scenario: When default expiration is activated for post, the Enable Post Expiration checkbox should be checked by default for a new post
    Given default expiration is activated for "post"
    When I am adding a new post
    Then the checkbox Enable Post Expiration is activated on the component panel

  Scenario: When default expiration is activated for post, I can disable it for a new post
    Given default expiration is activated for "post"
    When I am adding a new post with title "Post B" on Gutenberg
    When I uncheck the Enable Post Expiration checkbox on Gutenberg
    And I save the post on Gutenberg
    Then the checkbox Enable Post Expiration is deactivated on the component panel

  Scenario: When default expiration is activated for post, I can disable it for an existent post
    Given default expiration is activated for "post"
    And post "post_4" exists
    And I am editing post "post_4"
    When I uncheck the Enable Post Expiration checkbox on Gutenberg
    And I save the post on Gutenberg
    Then the checkbox Enable Post Expiration is deactivated on the component panel
