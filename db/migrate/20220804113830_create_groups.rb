class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :category
      t.boolean :request

      t.timestamps
    end
  end
end
