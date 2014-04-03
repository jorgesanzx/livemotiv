class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :set_test, only: [:test, :process_test]

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

  def test
  end

  def process_test
    if @test.update(test_params)
      flash[:success] = "Test was successfully processed."
      redirect_to current_user.profile
    else
      render action: "test"
    end
  end

  private

  def set_profile
    @profile = Profile.friendly.find(params[:profile_id])
  end

  def set_test
    current_profile = current_user.profile
    @test = Test.find_or_create_by(profile_id: current_profile.id)
  end

  def profile_params
    params.require(:profile).permit(:name, :location, :gender, :age, :job, :web, :summary, :what_i_look_for, :offer_help?, :receive_help?)
  end

  def test_params
    params.require(:test).permit(:openness, :conscientiousness, :extraversion, :agreeableness, :neuroticism)
  end
end
