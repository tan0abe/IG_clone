class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true #:usersが追加したいテーブル名で、:emailがそのテーブルの中にあるインデックスを追加する対象のカラムを指定している
  end
end
