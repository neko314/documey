class ChangeColumnsDateAndTimeOfSeminars < ActiveRecord::Migration[5.2]
  def change
    change_column :seminars, :start_at, :datetime
    change_column :seminars, :finish_at, :datetime
  end
end
