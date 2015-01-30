class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :game, null: false
      t.string :name, null: false
      t.boolean :observer, null: false, default: 0

      t.integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
