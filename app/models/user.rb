class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, presence: true,
                                                                        format: { with: /\A\p{^ascii}+\z/, message: 'is invalid. Input full-width characters' }
  validates :password, presence: true,
                       format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/, message: 'is invalid. Include both letters and numbers' }
end
