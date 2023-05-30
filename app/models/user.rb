class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  validates :nickname, :birthday, presence: true
  validates :first_name, :last_name, presence: true,
                                     format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name_kana, :last_name_kana, presence: true,
                                               format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/, message: 'is invalid. Input full-width characters' }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/, message: 'is invalid. Include both letters and numbers' }
end
