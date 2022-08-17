class Article < ApplicationRecord
  belongs_to :user 
  belongs_to :group
  has_one_attached :image
  has_many :comments 
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true
end
