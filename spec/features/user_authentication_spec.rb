require 'rails_helper'

RSpec.feature "UserAuthentication", type: :feature do
  scenario "User signs up" do
    visit new_user_registration_path
    fill_in "Username", with: "TestUser"
    fill_in "Email", with: "testuser@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "User logs in" do
    user = User.create!(username: "TestUser", email: "testuser@example.com", password: "password")
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end
end