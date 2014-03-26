require 'spec_helper'

describe SessionsController do
  before :all do
    @auth_hash = {"provider" => "facebook",
                  "uid" => "'2'",
                  "info" => {"nickname" => "NickName",
                             "email" => "email@example.com",
                             "name" => "First Second Name",
                             "image" => "http://graph.facebook.com/2/picture",
                             "location" => "Madrid, Spain"},
                  "extra" => {"raw_info" => {"gender" => "male"}}}
  end

  before :each do
    SessionsController.any_instance.stub(:auth_hash).and_return(@auth_hash)
  end

  describe 'GET #create' do
    it 'responds successfully with an HTTP 200 status code' do
      get :create, provider: 'facebook'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the create template" do
      get :create, provider: 'facebook'
      expect(response).to render_template("create")
    end

    context 'when user is logged in' do
      context 'when authorization is in the database' do
        it 'does not add the authorization' do
          authorization = FactoryGirl.create(:authorization, provider: @auth_hash["provider"], uid: @auth_hash["uid"])
          user = authorization.user
          session[:user_id] = user.id

          expect{get :create, provider: 'facebook'}.to_not change(user.authorizations, :count)
        end
      end

      context 'when authorization is not in the database' do
        it 'adds the authorization' do
          user = FactoryGirl.create(:user)
          session[:user_id] = user.id

          expect{get :create, provider: 'facebook'}.to change(user.authorizations, :count)
        end
      end
    end

    context 'when user is not logged in' do
      context 'when authorization is in the database' do
        it 'logs the user in' do
          authorization = FactoryGirl.create(:authorization, provider: @auth_hash["provider"], uid: @auth_hash["uid"])
          user = authorization.user

          get :create, provider: 'facebook'
          expect(session[:user_id]).to eq(user.id)
        end
      end

      context 'when authorization is not in the database' do
        it 'creates a new user' do
          expect{get :create, provider: 'facebook'}.to change(User, :count)
        end

        it 'adds the authorization' do
          expect{get :create, provider: 'facebook'}.to change(Authorization, :count)
        end

        it 'logs him in' do
          get :create, provider: 'facebook'
          expect(session[:user_id]).to_not be_nil
        end
      end
    end
  end
end
