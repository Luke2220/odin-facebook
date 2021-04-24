class UserController < ApplicationController
    def show
        @user = User.find(params[:id])
       
    end

    def new

    end

    private

    def user_params
        params.requrie(:user).permit(:username,:id)
    end

end
