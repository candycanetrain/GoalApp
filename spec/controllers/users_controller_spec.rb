require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET# #new" do
    it "renders the new/sign up page" do
      get :new

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
  end

  describe "POST #create" do
    context "with valid params" do
      post :create, user: {username: "candra", password: "password"}
      expect(response).to redirect_to(goals_url)
    end
    context "with invalid params" do
      post :create, user: { username: "Ryley", password: "abc"}
      expect(response).to render_template("new")
      expect(flash[:errors]).to be_present
    end
  end

end
