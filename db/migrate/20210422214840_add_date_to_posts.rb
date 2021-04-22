class AddDateToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_date,:DateTime
  end
end
