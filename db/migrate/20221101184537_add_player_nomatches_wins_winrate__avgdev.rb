class AddPlayerNomatchesWinsWinrateAvgdev < ActiveRecord::Migration[6.1]
  def change
    add_column(:stat_blocks, :player, :string)
    add_column(:stat_blocks, :num_matches, :integer)
    add_column(:stat_blocks, :wins, :integer)
    add_column(:stat_blocks, :win_rate, :float)
    add_column(:stat_blocks, :avg_deviation, :float)
  end
end
