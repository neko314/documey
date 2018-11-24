# frozen_string_literal: true

class AddColumnPointToSeminars < ActiveRecord::Migration[5.2]
  def change
    add_column :seminars, :point, :integer, null: false, default: 5
  end
end
