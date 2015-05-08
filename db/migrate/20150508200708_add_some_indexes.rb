class AddSomeIndexes < ActiveRecord::Migration
  def change
    add_index 'games',    'token',     unique: true
    add_index 'plays',    'story_id'
    add_index 'plays',    ['user_id',  'story_id'],     unique: true
    add_index 'stories',  ['game_id',  'description'],  unique: true
    add_index 'users',    ['game_id',  'name'],         unique: true
  end
end
