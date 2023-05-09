# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.date :date
      t.time :time
      t.integer :movie_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end