class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|

      t.string :bio
      t.string :user_id
      t.timestamps
    end
  end
end