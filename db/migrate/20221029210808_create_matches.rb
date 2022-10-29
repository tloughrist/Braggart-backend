class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.datetime :match_date
      t.integer :game_id
    end
  end
end
