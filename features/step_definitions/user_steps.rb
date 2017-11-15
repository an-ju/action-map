When /I (un)?check the following interests: (.*)/ do |uncheck, interest_list|
    interest_list.split(', ').each do |interest|
        step %{I #{uncheck.nil? ? '' : 'un'}check "interests_#{interest}"}
    end
end

Then /the following interests should (not )?be checked: (.*)/ do |uncheck, interest_list|
    interest_list.split(', ').each do |interest|
        step %{the "interests_#{interest}" checkbox should#{uncheck.nil? ? '' : ' not'} be checked}
    end
end

Given /^I am signed in with provider "([^"]*)"$/ do |provider|
    if provider.downcase == "google"
        visit login_path
    end
end

Given /^a user with email '(.*)' and (.*) privileges exists$/ do |email, privileges|
  if privileges == 'admin'
    User.create(:email => email, :admin => true)
  elsif privileges == 'normal'
    User.create(:email => email)
  end
end

Given /^I am (signed|logged) in with email (.*)$/ do |email|
  session[:user_id] = User.find_by_email(email).id
end
