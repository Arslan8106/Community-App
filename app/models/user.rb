class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups, through: :memberships
  has_many :articles, through: :memberships
  has_many :memberships 
  has_one_attached :image
  has_many :comments, through: :memberships
  has_many :owned_group, foreign_key: "user_id", class_name: "Group"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
