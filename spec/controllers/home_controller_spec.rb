require 'spec_helper'

# describe HomeController do
#   context "when user is not logged in" do
#     describe "GET #index" do
#       it "redirects to new_user_session_path" do
#         get :index
#         expect(response).to redirect_to(new_user_session_path)
#       end
#     end
#   end

#   context "when user is logged in" do
#     before :each do
#       user = FactoryGirl.create(:user)
#       sign_in user
#     end

#     describe "GET #index" do
#       it "returns http success" do
#         get :index
#         expect(response).to be_success
#       end

#       it "renders the index template" do
#         get :index
#         expect(response).to render_template(:index)
#       end
#     end
#   end
# end
