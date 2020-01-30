class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books,dependent: :destroy
         attachment :profile_image

         validates :name,    length: { minimum: 2 }       # 「1文字以上」
		 validates :name,    length: { maximum: 20 }      # 「75文字以下」
         validates :introduction,    length: { maximum: 50 }      # 「75文字以下」
end
