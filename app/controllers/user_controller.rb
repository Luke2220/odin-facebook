class UserController < ApplicationController
    def show
        @user = User.find(params[:id])
        if params[:format]
            @comment = Comment.find(params[:format])
        end
    end

    private

    def user_params
        params.requrie(:user).permit(:username,:id)
    end

end
