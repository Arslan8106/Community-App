class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_one_attached :image
  validates :body, presence: true
  validates :user_name, presence: true
end
