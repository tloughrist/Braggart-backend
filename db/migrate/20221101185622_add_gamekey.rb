class AddGamekey < ActiveRecord::Migration[6.1]
  def change
    add_column(:stat_blocks, :game_id, :integer)
  end
end
