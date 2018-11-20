# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :membership_number
      t.string :email, null: false
      t.references :seminar, foreign_key: true

      t.timestamps
    end
  end
end
