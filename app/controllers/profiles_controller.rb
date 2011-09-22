class ProfilesController < ApplicationController

  def new
  	@profile = Profile.new
  end
  
  def create
    current_user.profile = Profile.new(params[:profile])
    if current_user.profile.save
      redirect_to user_path(current_user)
      flash[:success] = "User created!"
    else
      render 'new'
    end
  end
  
  def show
    @profile = Profile.find(params[:id])
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end
  
  def update
  	@profile = current_user.profile
  	if @profile.update_attributes(params[:profile])
  	  flash[:success] = "Profile has been updated!"
  	  redirect_to user_path(current_user)
  	else
  	  flash[:error] = "Something went wrong."
  	  render 'edit'
  	end
  end
  
end
