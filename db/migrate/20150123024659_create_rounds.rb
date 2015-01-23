class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :game_id, null: false
      t.string :description, null: false

      t.integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
