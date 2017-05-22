@api @top-stuff
Feature: Editors should be able to add text and media to the top of pages.

  Scenario: Make sure Top Stuff text and media fields are present and visible to Basic page creators.
    Given I am logged in as a user with the "Basic page creator" role
    When I am on "/node/add/page"
    Then I should see "Text + Media"

  Scenario: Make sure Top Stuff is correctly rendered on display.
    Given I am logged in as a user with the "Administrator" role
    And page content:
      | title     | path       | moderation_state |
      | Top Stuff | /top-stuff | published        |
    And I visit "/top-stuff"
    And I click "New draft"
    And I press the "Add Text + Media" button
    And I enter "This is the media description" for "Text"
    And I press the "Save" button
    And I am an anonymous user
    And I visit "/top-stuff"
    Then I should see "This is the media description"