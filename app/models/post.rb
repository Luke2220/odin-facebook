class Post < ApplicationRecord
    belongs_to :User
    has_many :comments, as: :commentable
    has_many_attached :images
end
