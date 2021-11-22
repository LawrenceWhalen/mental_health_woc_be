class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :parent

  validates :title, presence: true
  validates :content, presence: true
end
