require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content("New User!")
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', with: "test_username"
      fill_in 'Password', with: "test_password"
      click_on "Sign Up"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content("test_username")
      expect(page).to have_content("All Goals")
    end

  end

end


feature "Session stuff" do

  before(:each) do
    visit new_user_url
    fill_in 'Username', with: "test_username"
    fill_in 'Password', with: "test_password"
    click_on "Sign Up"
    click_on "Sign Out"
  end

  feature "logging in" do
    before(:each) do
      visit new_session_url
      fill_in 'Username', with: "test_username"
      fill_in 'Password', with: "test_password"
      click_on 'Sign In'
    end
    scenario "shows username on the homepage after login" do
      expect(page).to have_content("test_username")
      expect(page).to have_content("All Goals")
    end

  end

  feature "logging out" do
    before(:each) do
      visit new_session_url
      fill_in 'Username', with: "test_username"
      fill_in 'Password', with: "test_password"
      click_on 'Sign In'
      click_button "Sign Out"
    end

    scenario "begins with a logged out state" do
      expect(page).not_to have_content("Sign Out")
      expect(page).to have_content("Sign In")
    end

    scenario "doesn't show username on the homepage after logout" do
      expect(page).not_to have_content("test_username")
    end

  end
end
