class FriendRequestController < ApplicationController

    def create
        @user = User.find(params[:recipient_id])
        @sender = User.find(params[:sender_id])
        @user.friend_requests.create!(recipient_id: @user.id, sender_id: @sender.id, sender_name: @sender.username)
        redirect_to user_path(@user.id), notice: 'Friend Request Sent'
    end

    def new
       @friend_request = FriendRequest.find(params[:friend_id])

       @receiver = User.find(@friend_request.recipient_id)
        @sender = User.find(@friend_request.sender_id)
        @receiver.friends.create!(friend_username: @sender.username)
        @sender.friends.create!(friend_username: @receiver.username)

       @friend_request.destroy
       redirect_to user_path(current_user.id), notice: 'Accepted Friend Request'
    end

    private

    def friend_params
        params.require(:user).permit(:recipient_id, :sender_id,:friend_id)
    end

end
