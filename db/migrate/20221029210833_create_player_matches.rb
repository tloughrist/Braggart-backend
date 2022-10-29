class CreatePlayerMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :player_matches do |t|
      t.integer :match_id
      t.integer :player_id
      t.integer :points
    end
  end
end
