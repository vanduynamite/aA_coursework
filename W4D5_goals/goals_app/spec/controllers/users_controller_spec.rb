require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  describe "GET#new" do

    it "renders a new user page" do
      get :new
      expect(response).to render_template(:new)
    end

  end

  describe "POST#create" do

    valid_input = { user: { username: "ssassha", password: "dj83n^fwwI" } }
    invalid_input = { user: { username: "ssassha", password: "dI" } }

    context "with valid input" do

      it "add user to database" do
        post :create, params: valid_input
        expect(User.last.username).to eq("ssassha")
      end

      it "redirects to the homepage" do
        post :create, params: valid_input
        expect(response).to redirect_to(user_goals_url(User.last))
      end

    end

    context "with invalid input" do
      it "renders new user screen" do
        post :create, params: invalid_input
        expect(response).to render_template(:new)
      end
    end

  end

end
