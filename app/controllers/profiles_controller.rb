class ProfilesController < ApplicationController
    def new
        @user_id = params[:user_id]
        @profile = Profile.new
    end
    
    def edit
        @user_id = params[:user_id]
        @profile = Profile.find(params[:id])
    end

    def update
        @profile = Profile.find(params[:id])
        if @profile.update!(profile_params)
            redirect_to user_path(current_user.id), notice: 'Profile Updated'
        else
            render edit_profile_path, alert: 'Could not Update'
        end 

    end

    def create
        @user = User.find(params[:profile][:user_id])
        @profile = @user.build_profile(profile_params)
        @user.avatar.attach(params[:profile][:avatar])

        if @profile.save
            redirect_to user_path(current_user.id), notice: 'Profile Info Added'
        else
            render new_profile_path, alert: 'Could not Add Info'
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:bio,:avatar,:user_id)
    end
end
