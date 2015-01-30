class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :game_id, null: false
      t.string :description, null: false
      t.boolean :complete, null: false, default: false

      t.integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
