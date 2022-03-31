require 'rails_helper'


RSpec.describe "/exercises", type: :request do
  
  let(:user) { User.create(email: 'user@mail.com', password: 123456) }
  before :each  do 
    login_as user, scope: :user
  end
  let(:valid_attributes) {
    { description: 'Valid Exercise', intensity: 10 }
  }
  
  let(:invalid_attributes) {
    { description: '', intensity: 10 }
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_exercise_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Exercise" do
        expect {
          post exercises_url, params: { exercise: valid_attributes }
        }.to change(Exercise, :count).by(1)
      end

      it "redirects to the created exercise" do
        post exercises_url, params: { exercise: valid_attributes }
        expect(response).to redirect_to(routines_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Exercise" do
        expect {
          post exercises_url, params: { exercise: invalid_attributes }
        }.to change(Exercise, :count).by(0)
      end

      it "renders error message" do
        post exercises_url, params: { exercise: invalid_attributes }
        expect(response.body).to include("Description can&#39;t be blank")
      end

      it "renders a unprocessable_intity response" do
        post exercises_url, params: { exercise: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
