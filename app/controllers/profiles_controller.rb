class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = "Profile was successfully updated."
      redirect_to @profile
    else
      render action: "edit"
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
