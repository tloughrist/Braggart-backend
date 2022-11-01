# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_01_203100) do

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.boolean "high_score_to_win"
  end

  create_table "matches", force: :cascade do |t|
    t.date "match_date"
    t.integer "game_id"
  end

  create_table "player_matches", force: :cascade do |t|
    t.integer "match_id"
    t.integer "player_id"
    t.integer "points"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
  end

  create_table "stat_blocks", force: :cascade do |t|
    t.string "player_name"
    t.integer "num_matches"
    t.integer "wins"
    t.float "win_rate"
    t.float "avg_deviation"
    t.integer "player_id"
    t.integer "game_id"
  end

end
