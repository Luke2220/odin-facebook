class UserController < ApplicationController
    def index
        @users = User.all.order(created_at: :DESC)
    end

    def show
        @user = User.find(params[:id])
       
    end

    private

    def user_params
        params.requrie(:user).permit(:username,:id)
    end

end
