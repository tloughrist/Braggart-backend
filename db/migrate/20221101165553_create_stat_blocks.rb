class CreateStatBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stat_blocks do |t|
      t.string :player_name
      t.integer :num_matches
      t.integer :wins
      t.float :win_rate
      t.float :avg_deviation
      t.integer :player_id
      t.integer :game_id
    end
  end
end
