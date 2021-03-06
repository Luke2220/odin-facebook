class Profile < ApplicationRecord
    belongs_to :user, optional: true
    has_one_attached :avatar
    has_many :comments, as: :commentable
end
