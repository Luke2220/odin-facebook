class FriendRequest < ApplicationRecord
   # has_one :recipient, class_name: 'User', foreign_key: 'friend_request_id'
   # has_one :sender, class_name: 'User', foreign_key: 'friend_request_id'

    belongs_to :User, optional: true

    scope :find_request, -> (current_user,friend){find_by('recipient_id == ? AND sender_id == ?',current_user,friend)}
end
