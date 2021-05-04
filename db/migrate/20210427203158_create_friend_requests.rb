class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.integer :sender_id
      t.string :sender_name
      t.timestamps
    end
  end
end
