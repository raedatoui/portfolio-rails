class AddSlideWithToPost < ActiveRecord::Migration
  def change
    add_column :posts, :slide_width, :integer
  end
end
