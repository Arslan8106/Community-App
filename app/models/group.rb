class Group < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :memberships,  dependent: :nullify
  has_many :articles, dependent: :nullify
  has_many :users, through: :memberships
  has_one_attached :image

end
