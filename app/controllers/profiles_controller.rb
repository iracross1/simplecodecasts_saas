class ProfilesController < ApplicationController
  def new
  # form where user can fill out their own profile. 
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile
  end
  def create
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      redirect_to user_path( params [:user_id])
      flash [:success] = "Profile Update!"
    else
      render action :new
  end
  
    def edit
  @user = User.find( params[:user_id] )
  @profile = @user.profile
end
    
  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
end