class Post < ApplicationRecord
  belongs_to :users

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
