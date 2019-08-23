class Post < ApplicationRecord
  belongs_to :users
  has_many :comments
  has_many :likes

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
