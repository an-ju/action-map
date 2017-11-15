Given /^I am on the admin page for (.*)$/ do |page|
  visit '/admin/'+page
end

When /^I go to the admin page for (.*)$/ do |page|
  visit '/admin/'+page
end

Then /^the county '(.*)' should have an activity of '(.*)'$/ do |county, activity|
  expect(County.find_by_name(county).activity).to eq(activity)
end

Then /^the state '(.*)' should have an activity of '(.*)'$/ do |state, activity|
  expect(State.find_by_name(state).activity).to eq(activity)
end
