class AddOwnerToMonsters < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :user_id, :integer, null: false, default: 1
    add_foreign_key :monsters, :users
  end
end
