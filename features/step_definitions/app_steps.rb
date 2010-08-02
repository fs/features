Given /^I am not authenticated$/ do
  visit(destroy_user_session_path)
end

#Given /^I am logged in as "(.*?)\/(.*?)"$/ do |email, password|
#  Given %{a user: "current_user" exists with email: "#{email}", password: "#{password}"}
#  And %{I go to the new user session page}
#  And %{I fill in "user_email" with "#{email}"}
#  And %{I fill in "user_password" with "#{password}"}
#  And %{I press "Sign in"}
#end

Given /^I am logged in as "(.*?)\/(.*?)"(?: with "(.*?)" role)?$/ do |email, password, role|
  Given %{a user: "current_user" exists with email: "#{email}", password: "#{password}"}

  model!('current_user').roles << Factory(:role, :name => role) if role

  And %{I go to the new user session page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

When /^I send "(GET|POST|PUT|DELETE)" request to (.+)$/ do |method, page_name|
  Capybara.current_session.driver.process(method.downcase.to_sym, path_to(page_name))
end

Then /^access should be denied by authentication$/ do
  Then %{I should be on the new user session page}
  And %{I should see "You need to sign in or sign up before continuing."}
end

Then /^access should be denied by authorization$/ do
  Then %{I should be on the root page}
  And %{I should see "You are not authorized to access this page."}
end
