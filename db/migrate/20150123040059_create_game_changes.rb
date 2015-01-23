class CreateGameChanges < ActiveRecord::Migration
  def change
    create_table :game_changes do |t|
      t.belongs_to :game, null: false
      t.integer :game_version, null: false
      t.string :kind, null: false
      t.belongs_to :user
      t.belongs_to :round

      t.timestamps
    end
  end
end
