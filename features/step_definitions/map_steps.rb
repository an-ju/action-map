Given /^a sample state with name '(.*)' exists$/ do |name|
  State.create(:name => name)
end

Given /^a sample county with name '(.*)' in '(.*)' exists$/ do |name, state|
  County.create(:name => name, :states_id => State.find_by_name(name).id)
end

Given /^the state (.*) has an activity of (.*)$/ do |state, activity|
  state = State.find_by_name(state)
  state.activity = activity
  state.save!
end

Given /^the county (.*) has an activity of (.*)$/ do |county, activity|
  county = County.find_by_name(county)
  county.activity = activity
  county.save!
end
