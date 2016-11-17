@candidates
@login
@android
@ios
Feature: Login Candidates

  @critical
  Scenario: Login as a valid user
    Given a valid user
    And I see the prelanding
    When I skip the candidates tutorial
    And I go to candidate login
    And I introduce my credentials
    And I log in
    Then I am redirected to the main page

  @critical
  Scenario: Login as a UK valid user
    Given a valid UK user
    And I see the prelanding
    When I skip the candidates tutorial
    And I go to candidate login
    And I introduce my credentials
    And I log in
    Then I am redirected to the main page

  Scenario: Delete input data
    Given a valid user
    And I see the prelanding
    When I skip the candidates tutorial
    And I go to candidate login
    And I introduce my email credential
    And I clear email input data
    Then I see the screen without data
