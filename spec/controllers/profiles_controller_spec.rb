require 'spec_helper'

describe ProfilesController do
  before :each do
    sign_in FactoryGirl.create(:user)
  end

  context "when profile exists" do
    let(:profile) {FactoryGirl.create(:profile)}
    let(:profile_params) {FactoryGirl.attributes_for(:profile)}

    describe "GET #show" do
      it "returns http success" do
        get :show, profile_id: profile.id
        expect(response).to be_success
      end

      it "renders the show template" do
        get :show, profile_id: profile.id
        expect(response).to render_template("show")
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, profile_id: profile.id
        expect(response).to be_success
      end

      it "renders the edit template" do
        get :edit, profile_id: profile.id
        expect(response).to render_template("edit")
      end
    end

    describe "PATCH #update" do
      it "redirects to profile" do
        patch :update, profile_id: profile.id, profile: profile_params
        expect(response).to redirect_to(profile)
      end
    end

    describe "PUT #update" do
      it "redirects to profile" do
        put :update, profile_id: profile.id, profile: profile_params
        expect(response).to redirect_to(profile)
      end
    end
  end

  context "when profile does not exist" do
    describe "GET #show" do
      it "redirects to root" do
        get :show, profile_id: -1
        expect(response).to be_not_found
      end
    end

    describe "GET #edit" do
      it "redirects to root" do
        get :edit, profile_id: -1
        expect(response).to be_not_found
      end
    end

    describe "PATCH #update" do
      it "redirects to root" do
        patch :update, profile_id: -1, profile: {}
        expect(response).to be_not_found
      end
    end

    describe "PUT #update" do
      it "redirects to root" do
        put :update, profile_id: -1, profile: {}
        expect(response).to be_not_found
      end
    end
  end
end
