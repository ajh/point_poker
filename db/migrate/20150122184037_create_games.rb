class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :token, null: false
      t.integer :events_count
      t.integer :rounds_count
      t.integer :users_count

      t.integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
