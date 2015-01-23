class CreateEvents < ActiveRecord::Migration
  def change
    # * round created by user
    # * round ended by user
    # * card chosen by user for a round
    create_table :events do |t|
      t.belongs_to :game, null: false
      t.belongs_to :round
      t.belongs_to :user
      t.string :type, null: false

      t.integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
