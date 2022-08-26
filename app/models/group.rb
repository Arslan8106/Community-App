class Group < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :memberships,  dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :users, through: :memberships, dependent: :destroy  
  has_one_attached :image

end
