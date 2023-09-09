# frozen_string_literal: true

class ChangeColumnsToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :creatures, :hit_points
    add_column :creatures, :hit_points, :integer
    remove_column :creatures, :cr
    add_column :creatures, :cr, :integer
    remove_column :creatures, :armor_class
    add_column :creatures, :armor_class, :integer
  end
end
