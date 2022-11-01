class AddPlayerkey < ActiveRecord::Migration[6.1]
  def change
    add_column(:stat_blocks, :player_id, :integer)
  end
end
