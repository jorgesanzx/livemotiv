class MyCommunityController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.profile.valid_for_matching?
      Connection.matching(current_user.profile)
      @profiles_connected = Connection.profiles_connected(current_user)
      @affinities = Connection.affinities(current_user)
    else
      flash[:info] = "You need to entry more information so we can find similar people to you."
      redirect_to current_user.profile
    end
  end

  def update
  end
end
