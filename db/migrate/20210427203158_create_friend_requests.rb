class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.string :user_id
      t.string :recipient_id
      t.string :sender_id
      t.string :sender_name
      t.timestamps
    end
  end
end
