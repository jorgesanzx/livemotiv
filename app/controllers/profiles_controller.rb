class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile was successfully updated."
    else
      render action: "edit"
    end
  end

  def matching
    if current_user.profile.valid_for_matching?
      Connection.matching(current_user.profile)
      redirect_to current_user.profile, notice: "You have been matched."
    else
      redirect_to current_user.profile, notice: "You need to entry more information."
    end
  end

  private

  def set_profile
    @profile = Profile.friendly.find(params[:profile_id])
  end

  def profile_params
    params.require(:profile).permit(:name, :location, :gender, :age, :job, :web, :summary, :what_i_look_for, :offer_help?, :receive_help?)
  end
end
