class Like < ApplicationRecord
    belongs_to :User, optional: true
    belongs_to :Post, optional: true
end
