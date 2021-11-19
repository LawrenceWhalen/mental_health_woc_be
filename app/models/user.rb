class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable, :recoverable, :rememberable and :omniauthable
  devise :database_authenticatable, :validatable

  has_many :posts
  has_many :comments
end
