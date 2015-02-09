class AddUserNameColumnToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :user_name, :string, null: false
  end
end
