class AddProjectUrlToPost < ActiveRecord::Migration
  def change
    add_column :posts, :project_url, :string
  end
end
