class FriendRequestController < ApplicationController

    def create
        @user = User.find(params[:recipient_id])
        @user.friend_requests << User.find(params[:sender_id])
        redirect_to user_path(@user.id), notice: 'Friend Request Sent'
    end

    def update
       
    end

    private

    def friend_params
        params.require(:user).permit(:recipient_id, :sender_id)
    end

end
