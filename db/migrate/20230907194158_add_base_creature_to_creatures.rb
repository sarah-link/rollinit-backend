class AddBaseCreatureToCreatures < ActiveRecord::Migration[7.0]
  def change
    add_column :creatures, :base_creature, :boolean, default: false
  end
end
