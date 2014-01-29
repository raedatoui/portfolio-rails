class AddDisplayOrderToPost < ActiveRecord::Migration
  def change
    add_column :posts, :display_order, :integer
  end
end
