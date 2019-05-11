class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :title, length: { minimum: 1 }
  validates :title, length: { maximum: 30 }
  validates :content, length: { minimum: 1 }
  validates :content, length: { maximum: 140 }
  validates :image_path, presence: true

  mount_uploader :image_path, ImageUploader #postsテーブルの中にあるimage_pathカラムにImageUploaderという名前のアップローダ機能を追加
end
