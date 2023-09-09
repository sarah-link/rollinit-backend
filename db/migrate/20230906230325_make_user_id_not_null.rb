# frozen_string_literal: true

class MakeUserIdNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :monsters, :user_id, false
  end
end
