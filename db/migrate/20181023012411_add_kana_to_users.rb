# frozen_string_literal: true

class AddKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :kana, :string, null: false, default: ""
  end
end
