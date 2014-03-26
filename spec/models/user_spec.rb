require 'spec_helper'

describe User do
  describe 'email' do
    context 'when present' do
      it 'is valid' do
        user = User.new email: "email@example.com"
        expect(user).to have(0).error_on(:email)
      end
    end

    context 'when not present' do
      it 'is not valid' do
        user = User.new email: ""
        expect(user).to have(1).error_on(:email)
      end
    end
  end

  describe '.add_provider' do
    let(:auth_hash) do {"provider" => "facebook",
                        "uid" => "'2'",
                        "info" => {"nickname" => "NickName",
                                   "email" => "email@example.com",
                                   "name" => "First Second Name",
                                   "image" => "http://graph.facebook.com/2/picture",
                                   "location" => "Madrid, Spain"},
                        "extra" => {"raw_info" => {"gender" => "male"}}}
    end

    context 'when authorization does not already exists' do
      it 'creates a new authorization for that user' do
        user = FactoryGirl.create(:user)
        expect{user.add_provider(auth_hash)}.to change{user.authorizations.count}.from(0).to(1)
      end
    end
  end
end
