
require 'spec_helper'
require 'rails_helper'

feature "Creating goals" do

  before do
    visit new_user_url
    fill_in 'Username', with: "test_username"
    fill_in 'Password', with: "test_password"
    click_on "Sign Up"
  end

  scenario "has a goal creation page" do
    visit new_goal_url
    expect(page).to have_content("Create Goal")
  end

  feature "creating a goal" do
    before { visit new_goal_url }
    scenario "with valid params" do

      fill_in "Title", with: "get a job"
      fill_in "Description", with: "test description"
      click_button "Create Goal"
      expect(page).to have_content("get a job")
      expect(page).to have_content("test description")
      expect(current_path).to eq("/goals/#{Goal.last.id}")
    end

    scenario "without valid params" do
      fill_in "Title", with: ""
      click_button "Create Goal"
      expect(page).to have_content("Title can't be blank")
      expect(current_path).to eq("/goals/new")
    end
  end

  feature "editing a goal" do
    before do
      visit new_goal_url
      fill_in "Title", with: "get a job"
      fill_in "Description", with: "test description"
      click_button "Create Goal"
      visit edit_goal_url(Goal.last)
    end
    scenario "with valid params" do
      fill_in "Title", with: "get a job"
      fill_in "Description", with: "edit description"
      click_button "Edit Goal"
      expect(page).to have_content("get a job")
      expect(page).to have_content("edit description")
      expect(current_path).to eq("/goals/#{Goal.last.id}")
    end

    scenario "without valid params" do
      fill_in "Title", with: ""
      click_button "Edit Goal"
      expect(page).to have_content("Title can't be blank")
      expect(current_path).to eq("/goals/#{Goal.last.id}")
    end
  end

  feature "index shows all goals" do

  end


  feature "destroying a goal" do
    before do
      visit new_goal_url
      fill_in "Title", with: "get a job"
      fill_in "Description", with: "test description"
      click_button "Create Goal"
      visit goal_url(Goal.last)
      # expect(page).to have_content("get a job")
    end

    scenario "deletes goal from goals" do
      click_button "Delete Goal"
      expect(current_path).to eq("/goals/")
      expect(page).not_to have_content("get a job")
    end
  end

end
