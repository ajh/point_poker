class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.belongs_to :round, null: false
      t.belongs_to :user, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
