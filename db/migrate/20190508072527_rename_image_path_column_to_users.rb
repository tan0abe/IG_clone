class RenameImagePathColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :image_path, :user_image
  end
end
