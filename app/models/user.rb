class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :posts, dependent: :destroy
         has_many :comments, as: :commentable, dependent: :destroy
         has_many :friends, class_name: 'User', foreign_key: 'friend_id'
        has_many :friend_requests, class_name: 'User', foreign_key: 'friend_request_id'
        has_many :likes, dependent: :destroy
         has_one_attached :avatar

         belongs_to :User, optional: true
end
