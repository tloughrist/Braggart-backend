class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :stat_blocks, :player, :player_name
  end
end
