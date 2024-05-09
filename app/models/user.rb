class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ユーザーが削除されたら、そのユーザーに関連する投稿も削除される
  has_many :posts, dependent: :destroy
end
