class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :posts, dependent: :destroy
         has_many :comments, as: :commentable, dependent: :destroy
         has_many :friends
        has_many :likes, dependent: :destroy
         has_one_attached :avatar
        has_one :profile
        has_many :friend_requests
        devise :omniauthable, omniauth_providers: %i[facebook]

        
         

         def already_friends?(friend)
          if friend != nil 
            if self.friends.pluck(:friend_username).include?(friend.username)
              return true
            end
          end
          false
         end

         def request_ids
         requestsID = self.friend_requests.pluck(:sender_id)
         end

         def already_requested?(receiver,sender)
          request = FriendRequest.where('recipient_id = $1 AND sender_id = $2',receiver.id,sender.id).take
          requestID = nil 
          if request != nil
            requestID = request.id   
          end
            if receiver.friend_requests.exists?(requestID)
              return true
            end 
          false
         end
end
