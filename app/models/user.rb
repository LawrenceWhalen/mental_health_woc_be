class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, :rememberable and :omniauthable
  devise :database_authenticatable, :validatable, :registerable, 
    :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :posts
  has_many :comments
end
