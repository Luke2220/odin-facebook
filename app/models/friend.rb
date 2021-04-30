class Friend < ApplicationRecord
    belongs_to :User, optional:true
end
