class Comment < ApplicationRecord
  belongs_to :post
  has_many :comments

  
  validates :post_id, presence: true
  validates :writeup, presence: true, length: { maximum: 100 }
end
