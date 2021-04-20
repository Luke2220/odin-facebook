class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true, optional: true
    belongs_to :Users, optional: true
end
