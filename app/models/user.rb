class User < ApplicationRecord
  has_many :posts
  has_many :favorites, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                    before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :user_image, presence: true

  mount_uploader :user_image, ImageUploader #usersテーブルの中にあるpictureカラムにImageUploaderという名前のアップローダ機能を追加
end
