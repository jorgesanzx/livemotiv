require 'spec_helper'

describe Authorization do
  describe 'provider' do
    it 'is valid when present' do
      authorization = Authorization.new provider: "facebook"
      expect(authorization).to have(0).error_on(:provider)
    end

    it 'is not valid when not present' do
      authorization = Authorization.new provider: ""
      expect(authorization).to have(1).error_on(:provider)
    end
  end

  describe 'uid' do
    it 'is valid when present' do
      authorization = Authorization.new uid: "'1'"
      expect(authorization).to have(0).error_on(:uid)
    end

    it 'is not valid when not present' do
      authorization = Authorization.new uid: ""
      expect(authorization).to have(1).error_on(:uid)
    end
  end

  describe '.find_or_create' do

    let(:auth_hash) do {"provider" => "facebook",
                        "uid" => "'2'",
                        "info" => {"nickname" => "NickName",
                                   "email" => "email@example.com",
                                   "name" => "First Second Name",
                                   "image" => "http://graph.facebook.com/2/picture",
                                   "location" => "Madrid, Spain"},
                        "extra" => {"raw_info" => {"gender" => "male"}}}
    end

    context 'when authorization already exists' do
      it 'returns the authorization' do
        created_authorization = FactoryGirl.create(:authorization, provider: auth_hash["provider"], uid: auth_hash["uid"])
        returned_authorization = Authorization.find_or_create(auth_hash)
        expect(created_authorization).to eq(returned_authorization)
      end
    end

    context 'when authorization does not already exists' do
      it 'creates a new user and creates an authorization for that user' do
        expect(User.all).to be_empty
        expect(Authorization.all).to be_empty
        authorization = Authorization.find_or_create(auth_hash)
        expect(User.all.count).to eq(1)
        expect(Authorization.all).to include(authorization)
      end
    end
  end
end
