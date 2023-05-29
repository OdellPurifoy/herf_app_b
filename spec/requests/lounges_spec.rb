require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/lounges", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Lounge. As you add validations to Lounge, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Lounge.create! valid_attributes
      get lounges_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      lounge = Lounge.create! valid_attributes
      get lounge_url(lounge)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_lounge_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      lounge = Lounge.create! valid_attributes
      get edit_lounge_url(lounge)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Lounge" do
        expect {
          post lounges_url, params: { lounge: valid_attributes }
        }.to change(Lounge, :count).by(1)
      end

      it "redirects to the created lounge" do
        post lounges_url, params: { lounge: valid_attributes }
        expect(response).to redirect_to(lounge_url(Lounge.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Lounge" do
        expect {
          post lounges_url, params: { lounge: invalid_attributes }
        }.to change(Lounge, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post lounges_url, params: { lounge: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested lounge" do
        lounge = Lounge.create! valid_attributes
        patch lounge_url(lounge), params: { lounge: new_attributes }
        lounge.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the lounge" do
        lounge = Lounge.create! valid_attributes
        patch lounge_url(lounge), params: { lounge: new_attributes }
        lounge.reload
        expect(response).to redirect_to(lounge_url(lounge))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        lounge = Lounge.create! valid_attributes
        patch lounge_url(lounge), params: { lounge: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested lounge" do
      lounge = Lounge.create! valid_attributes
      expect {
        delete lounge_url(lounge)
      }.to change(Lounge, :count).by(-1)
    end

    it "redirects to the lounges list" do
      lounge = Lounge.create! valid_attributes
      delete lounge_url(lounge)
      expect(response).to redirect_to(lounges_url)
    end
  end
end
