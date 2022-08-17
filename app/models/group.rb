class Group < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :memberships
  has_many :articles
  has_many :users, through: :memberships
  has_one_attached :image

end
