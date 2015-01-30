class Observers < ActiveRecord::Migration
  def change
    add_column :users, :observer, :boolean, null: false, default: false
  end
end
