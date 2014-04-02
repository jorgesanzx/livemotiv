class ProfilesController < ApplicationController
  before_action :set_profile

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

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def profile_params
    params.require(:profile).permit(:name, :location, :gender, :job, :web, :summary, :what_i_look_for, :offer_help?, :receive_help?)
  end
end
