class AddUserImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_image, :text
  end
end
