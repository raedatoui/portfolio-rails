class AddPublisherToPost < ActiveRecord::Migration
  def change
    add_column :posts, :publisher_id, :int
  end
end
