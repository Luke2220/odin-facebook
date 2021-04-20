class Post < ApplicationRecord
    belongs_to :User, optional: true
    has_many :comments, as: :commentable
    has_many :likes
    has_many_attached :images

    def liked?(user)
        likes.each do |like|
            if like.user_id.to_i == user.id.to_i
                return true
            end
        end
        return false
    end

    def get_like(user)
        likes.each do |like|
            if like.user_id.to_i == user.id.to_i
                return like.id
            end
        end
        return nil
    end

end
