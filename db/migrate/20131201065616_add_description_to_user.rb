class AddDescriptionToUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :description, :text
  end
end
