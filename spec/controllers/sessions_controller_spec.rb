require 'spec_helper'

describe SessionsController do
  let(:auth_hash) do {"provider" => "facebook",
                      "uid" => "'2'",
                      "info" => {"nickname" => "NickName",
                                 "email" => "email@example.com",
                                 "name" => "First Second Name",
                                 "image" => "http://graph.facebook.com/2/picture",
                                 "location" => "Madrid, Spain"},
                      "extra" => {"raw_info" => {"gender" => "male"}}}
  end

  describe '#create' do
    context 'when user is logged in' do
      context 'when authorization is new' do
        it 'adds the authorization' do
          user = FactoryGirl.create(:user)
          session[:user_id] = user.id
          ENV["omniauth.auth"] = "#{auth_hash}"

          expect{get :create, provider: 'facebook'}.to change(user.authorizations, :count)
          expect(response).to render_template(:create)
        end
      end
    end
  end
end
