class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :user_id
      t.string :friend_username
      t.timestamps
    end
  end
end