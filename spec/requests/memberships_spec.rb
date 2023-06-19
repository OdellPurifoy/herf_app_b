require 'rails_helper'

RSpec.describe "/memberships", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Membership. As you add validations to Membership, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryBot.create(:user) }
  let(:lounge) { FactoryBot.create(:lounge) }

  before { sign_in user }

  let(:valid_attributes) do 
    {
      first_name: 'Steve',
      last_name: 'Jones',
      email: 'steve_jones@example.com',
      phone: '800-123-4567',
      do_not_text: false,
      lounge: lounge
    }
  end
  let(:invalid_attributes) do
    {
      last_name: 'Jones',
      email: 'steve_jones@example.com',
      phone: '888-123-4567',
      do_not_text: false,
      lounge: lounge
    }
  end
  describe "GET /index" do
    it "renders a successful response" do
      get "/lounges/#{lounge.id}/memberships"
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:membership) {FactoryBot.create(:membership)}
    it "renders a successful response" do
      get "/memberships/#{membership.id}"
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    let(:membership) { FactoryBot.create(:membership) }

    it "renders a successful response" do
      get "/memberships/#{membership.id}"
      expect(response).to be_successful
    end
  end

  #TODO - make this work
  # describe "GET /edit" do
  #   let(:membership) { FactoryBot.create(:membership) }

  #   it "renders a successful response" do
  #     get "/memberships/#{membership.id}/edit"
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Membership" do
  #       expect {
  #         post "/lounges/#{lounge.id}/memberships", params: { membership: valid_attributes }
  #       }.to change(Membership, :count).by(1)
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not create a new Membership" do
  #       expect {
  #         post "/lounges/#{lounge.id}/memberships", params: { membership: invalid_attributes }
  #       }.to change(Membership, :count).by(0)
  #     end
  #   end
  # end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested membership" do
  #       membership = Membership.create! valid_attributes
  #       patch membership_url(membership), params: { membership: new_attributes }
  #       membership.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the membership" do
  #       membership = Membership.create! valid_attributes
  #       patch membership_url(membership), params: { membership: new_attributes }
  #       membership.reload
  #       expect(response).to redirect_to(membership_url(membership))
  #     end
  #   end

  #   context "with invalid parameters" do
    
  #     it "renders a response with 422 status (i.e. to display the 'edit' template)" do
  #       membership = Membership.create! valid_attributes
  #       patch membership_url(membership), params: { membership: invalid_attributes }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end
    
  #   end
  # end

  # describe "DELETE /destroy" do
  #   it "destroys the requested membership" do
  #     membership = Membership.create! valid_attributes
  #     expect {
  #       delete membership_url(membership)
  #     }.to change(Membership, :count).by(-1)
  #   end

  #   it "redirects to the memberships list" do
  #     membership = Membership.create! valid_attributes
  #     delete membership_url(membership)
  #     expect(response).to redirect_to(memberships_url)
  #   end
  # end
end
