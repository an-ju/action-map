Feature: The admin to the website should be able to manually alter the data on the page

  As an admin
  So that I can alter the data displayed on the map
  I want to change the activity of different states and counties

Background:
  Given a user with email 'admin' and admin privileges exists
  And a sample state with name 'Sample State' exists
  And a sample county with name 'Sample County' in 'Sample State' exists

Scenario: alter the value of a state
  Given I am signed in with email 'admin'
  And I am on the admin page for the map
  And the state 'Sample State' has an activity of 'inactive'
  When I select 'active' for the state 'Sample State'
  Then the state 'Sample State' should have an activity of 'active'

Scenario: alter the value of a county
  Given I am signed in with email 'admin'
  And I am on the admin page for the map
  And the county 'Sample County' has an activity of 'inactive'
  When I select 'active' for the county 'Sample County'
  Then the county 'Sample County' should have an activity of 'active'

Scenario: activity of a state should be reflected in the select box
  Given I am signed in with email 'admin'
  And the county 'Sample County' has an activity of 'inactive'
  And the state 'Sample State' has an activity of 'active'
  When I go to the admin page for the map
  Then I should see 'Sample State' has 'active' selected
  And I should see 'Sample County' has 'inactive' selected

Scenario: user that is not logged in cannot access the admin page
  Given I am not signed in
  When I go to the admin page for the map
  Then I should see the 'Denied Access' page

Scenario: non-admin user cannot access the admin page
  Given a user with email 'nonadmin' and normal privileges exists
  When I go to the admin page for the map
  Then I should see the 'Denied Access' page
