class FriendRequestController < ApplicationController

    def create
        @user = User.find(params[:recipient_id])
        @friend_req = User.find(params[:sender_id])
        @user.friend_requests << User.find(params[:sender_id])
        redirect_to user_path(@user.id), notice: 'Friend Request Sent'
    end

    def new
        @friend = User.find(params[:friend_id])
       current_user.friends << @friend
       @friend.friends << current_user
       current_user.friend_requests.delete(@friend.id)
       redirect_to user_path(current_user.id), notice: 'Accepted Friend Request'
    end

    private

    def friend_params
        params.require(:user).permit(:recipient_id, :sender_id,:friend_id)
    end

end
