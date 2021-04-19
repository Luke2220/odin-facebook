class Post < ApplicationRecord
    belongs_to :User, optional: true
    has_many :comments, as: :commentable
    has_many_attached :images
end
