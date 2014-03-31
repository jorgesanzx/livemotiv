require 'spec_helper'

describe Users::OmniauthCallbacksController do
  before :each do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: "facebook",
      uid:      "2",
      info:     {nickname: "NickName",
                 email: "email@example.com",
                 name: "First Second Name",
                 image: "http://graph.facebook.com/2/picture",
                 location: "Madrid, Spain"},
      extra:    {raw_info: {gender: "male"}}})
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"]  = OmniAuth.config.mock_auth[:facebook]
  end

  describe "GET #facebook" do
    context "when user is new" do
      it "signs him up" do
        expect{get :facebook}.to change(User, :count)
      end

      it "creates a profile for him" do
        expect{get :facebook}.to change(Profile, :count)
      end

      it "signs the user in" do
        get :facebook
        expect(subject.current_user).to_not be(nil)
      end
    end

    context "when user is already signed up" do
      before :each do
        @user = FactoryGirl.create(:user, provider: "facebook", uid: "2")
      end

      it "does not create a new user" do
        expect{get :facebook}.to_not change(User, :count)
      end

      it "does not create a new profile" do
        expect{get :facebook}.to_not change(Profile, :count)
      end

      it "signs the user in" do
        get :facebook
        expect(subject.current_user).to eq(@user)
      end
    end

    it "redirects to root" do
      get :facebook
      expect(response).to redirect_to(root_path)
    end
  end
end
