class ProfileController < ApplicationController
    def new
        @user_id = params[:user_id]
        @profile = Profile.new
    end
    
    def create
        @user = User.find(params[:profile][:user_id])
        @profile = @user.build_profile(profile_params)
        @user.avatar.attach(params[:profile][:avatar])

        if @profile.save
            redirect_to user_path(current_user.id), notice: 'Profile Updated'
        else
            render profile_index_path, alert: 'Could not update'
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:bio,:avatar,:user_id)
    end
end
