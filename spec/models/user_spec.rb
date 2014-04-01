require 'spec_helper'

describe User do
  describe ".sign_in_or_sign_up" do
    let(:provider) {"facebook"}
    let(:uid) {"2"}
    let(:user_info) do
      {email: "email@example.com",
       nickname: "First Second Name",
       name: "First Second Name",
       image: "http://graph.facebook.com/2/picture",
       location: "Madrid, Spain",
       gender: "male"}
    end

    context "when user is new" do
      it "signs him up" do
        expect{User.sign_in_or_sign_up(provider, uid, user_info)}.to change(User, :count)
      end

      it "creates a profile for him" do
        expect{User.sign_in_or_sign_up(provider, uid, user_info)}.to change(Profile, :count)
      end

      it "returns the user" do
        expect(User.sign_in_or_sign_up(provider, uid, user_info)).to be_instance_of(User)
      end
    end

    context "when user is already signed up" do
      it "returns the user" do
        user = User.sign_in_or_sign_up(provider, uid, user_info)
        expect(User.sign_in_or_sign_up(provider, uid, user_info)).to eq(user)
      end
    end
  end
end
