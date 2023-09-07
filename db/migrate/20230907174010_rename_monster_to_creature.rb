class RenameMonsterToCreature < ActiveRecord::Migration[7.0]
  def change
    rename_table :monsters, :creatures
    rename_column :creatures, :monster_type, :creature_type
  end
end
