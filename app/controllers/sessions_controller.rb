class SessionsController < ApplicationController
  def create
    # @user = User.find_or_create_from_auth_hash(auth_hash)
    # self.current_user = @user
    # redirect_to '/'
    # @auth_hash = auth_hash
    # session[:user_id] = user.id
    # flash[:notice] = "You've signed in"
    if session[:user_id]
      User.find(session[:user_id]).add_provider(auth_hash)
      flash[:notice] = "You can now login using #{auth_hash['provider'].capitalize} too!"
    else
      auth = Authorization.find_or_create(auth_hash)
      session[:user_id] = auth.user.id
      flash[:notice] = "Welcome #{auth.user.name}!"
    end
    @user = User.find(session[:user_id])
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  end

  def failure
    flash[:notice] = params[:message]
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out!"
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
