class MakePointValuesDecimal < ActiveRecord::Migration
  def self.up
    change_column :plays, :value, :decimal, null: false, scale: 3, precision: 5
  end

  def self.down
    change_column :plays, :value, :integer, null: false
  end
end
