class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.date :match_date
      t.integer :game_id
    end
  end
end
