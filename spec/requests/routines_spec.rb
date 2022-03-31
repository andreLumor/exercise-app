require 'rails_helper'

RSpec.describe "/routines", type: :request do
  fixtures :exercises   
  let(:user) { User.create(email: 'user@mail.com', password: 123456) }
  let(:exercise) { Exercise.create(description: 'Exercise', intensity: 10) }
  
  before :each  do 
    login_as user, scope: :user
  end

  let(:valid_attributes) {
    { name: 'Valid Routine', exercise_ids: [Exercise.first.id, Exercise.second.id] }
  }
  
  let(:invalid_attributes) {
    { name: '', exercise_ids: nil }
  }


  describe "GET /index" do
    it "renders a successful response" do
      get routines_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_routine_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Routine" do
        expect {
          post routines_url, params: { routine: valid_attributes }
        }.to change(Routine, :count).by(1)
      end

      it "redirects to the created routine" do
        post routines_url, params: { routine: valid_attributes }
        expect(response).to redirect_to(routines_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Routine" do
        expect {
          post routines_url, params: { routine: invalid_attributes }
        }.to change(Routine, :count).by(0)
      end

      it "renders error messages" do
        post routines_url, params: { routine: invalid_attributes }
        expect(response.body).to include("Exercises can&#39;t be blank")
        expect(response.body).to include("Exercises can&#39;t be blank")
      end

      it "renders a unprocessable_intity response" do
        post routines_url, params: { routine: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
