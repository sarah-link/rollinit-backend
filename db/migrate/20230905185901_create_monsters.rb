# frozen_string_literal: true

class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :name, null: false
      t.string :size
      t.string :monster_type
      t.string :alignment
      t.string :armor_class
      t.string :hit_points
      t.integer :speed
      t.integer :str
      t.string :str_mod
      t.integer :dex
      t.string :dex_mod
      t.integer :con
      t.string :con_mod
      t.integer :int
      t.string :int_mod
      t.integer :wis
      t.string :wis_mod
      t.integer :cha
      t.string :cha_mod
      t.string :saving_throws
      t.string :skills
      t.string :senses
      t.string :languages
      t.string :cr
      t.text :traits
      t.text :actions
      t.text :legendary_actions
      t.text :damage_immunities
      t.text :condition_immunities
      t.text :damage_resistances
      t.text :damage_vulnerabilities
      t.text :reactions

      t.timestamps
    end
  end
end
