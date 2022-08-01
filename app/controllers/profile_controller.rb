#This file should have get and post functions for profile. "get" should get from "/changeProfile" "post" should post to "/toDatabase" 
class ProfileController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]
  
    # GET /profile
    def index
      @profile = Profile.all
    end
  
    # GET /profile/1
    def show
    end
  
    # GET /profile/new
    def new
      @profile = Profile.new
    end
  
    # GET /profile/1/edit
    def edit
    end
  
    # POST /profile
    def create
      @profile = Profile.new(profile_params)
  
      if @profile.save
        redirect_to @profile, notice: 'profile was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /profile/1
    def update
      if @profile.update(profile_params)
        redirect_to profile_url, notice: 'Your profile has been updated.'
      else
        render :edit
      end
    end
  
    # DELETE /profile/1
    def destroy
      @profile.destroy
      redirect_to profile_url, notice: 'profile was successfully deleted.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_profile
        @profile = profile.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def profile_params
        params.require(:profile).permit()
      end
  end