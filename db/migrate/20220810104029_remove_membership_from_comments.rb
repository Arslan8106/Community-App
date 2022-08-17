class RemoveMembershipFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :membership, null: false, foreign_key: true
  end
end
