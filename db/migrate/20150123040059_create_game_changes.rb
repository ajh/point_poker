class CreateGameChanges < ActiveRecord::Migration
  def change
    create_table :game_changes do |t|
      t.belongs_to :game, null: false
      t.integer :game_version, null: false
      t.string :action, null: false
      t.belongs_to :play
      t.belongs_to :round
      t.belongs_to :user

      t.timestamps
    end
  end
end
