class CreateSeminars < ActiveRecord::Migration[5.2]
  def change
    create_table :seminars do |t|
      t.date :date
      t.time :start_at
      t.time :finish_at
      t.string :place
      t.string :title
      t.string :theme

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
