require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  before do
    post :create, user: {username: "candra", password: "password"}
    
  end

  describe "GET#new" do

    it "renders new page" do
      get :new
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates the goal" do
        post :create, goal: {title: "candra", description: "description"}
        expect(response).to redirect_to(goals_url)
      end
    end
    context "with invalid params" do
      it "renders new template with flash errors" do
        post :create, goal: { title: ""}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end
  end

  describe "DELETE #destroy" do
    post :create, goal: {title: "candra", description: "description"}
    it "it deletes goal and redirects to goals_url" do
      delete :destroy, goal: {id: Goal.find_by(title: "candra")
      expect(User.)
    end
  end
end
