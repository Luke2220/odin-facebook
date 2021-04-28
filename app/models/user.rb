class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :posts, dependent: :destroy
         has_many :comments, as: :commentable, dependent: :destroy
         has_many :friends, class_name: 'User', foreign_key: 'friend_id'
       # has_many :friend_requests, class_name: 'User', foreign_key: 'friend_request_id'
        has_many :likes, dependent: :destroy
         has_one_attached :avatar
        has_one :profile
        has_many :friend_requests

         belongs_to :User, optional: true
         

         def already_friends?(friend)
          if self.friends.exists?(friend.id)
            return true
          end
          false
         end


         def already_requested?(friend,current_user)
          if friend.friend_requests.exists?(FriendRequest.find_request(current_user.id,friend.id).take.id)    
            return true
          end
          false
         end

         def aaalready_requested?(friend,current_user)
          friend.friend_requests.each do |request|
            if request.sender_id == current_user.id
            return true
            end
          end
          false
         end

end
