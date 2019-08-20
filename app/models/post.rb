class Post < ApplicationRecord
  belongs_to :users
  has_many :likes
  has_many :comments

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
