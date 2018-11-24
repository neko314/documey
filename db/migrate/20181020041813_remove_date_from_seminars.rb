# frozen_string_literal: true

class RemoveDateFromSeminars < ActiveRecord::Migration[5.2]
  def change
    remove_column :seminars, :date, :date
  end
end
