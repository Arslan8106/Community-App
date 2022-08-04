class Article < ApplicationRecord
  belongs_to :membership
  belongs_to :group
end
