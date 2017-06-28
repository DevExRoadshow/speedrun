@api @paragraphs
Feature: Test paragraphs

  Scenario: Make sure paragraphs is enabled
    Given I am logged in as a user with the administrator role
    When I am on "/admin/reports/updates"
    Then I should see "Paragraphs"