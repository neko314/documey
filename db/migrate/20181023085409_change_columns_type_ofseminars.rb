# frozen_string_literal: true

class ChangeColumnsTypeOfseminars < ActiveRecord::Migration[5.2]
  def up
    remove_column :seminars, :start_at
    add_column :seminars, :start_at, :datetime
    remove_column :seminars, :finish_at
    add_column :seminars, :finish_at, :datetime
  end

  def down
    remove_column :seminars, :start_at
    add_column :seminars, :start_at, :time
    remove_column :seminars, :finish_at
    add_column :seminars, :finish_at, :time
  end
end
