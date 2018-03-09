class ProfilesController < ApplicationController
	before_action :authenticate_user!
	
	def index 
    end

    def show
      @profiles = Profile.find(params[:id])
    end

    def new
      @user = User.find(2)
      @profile = @user.profiles.new
    end

    def create
      @user = User.find(2)
    @profile = @user.profiles.new(profile_params)
    if @profile.save
      redirect_to profile_path(@user)
    else
      render :new
    end
    end

    def edit
      @profile = Profile.find(params[:id])
    end

    def update
      @profile= Profile.find(params[:id])
      if @profile.update(profile_params)
        redirect_to profiles_path
      else
        render :new
      end
    end

    def destroy
      @profile = Profile.find(params[:id])
      @profile.destroy
      redirect_to profiles_path
    end

  private
    def profile_params
      params.require(:profile).permit(:name, :number, :email, :account_balance)
    end
end
