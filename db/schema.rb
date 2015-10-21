# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151021200701) do

  create_table "fixtures", force: :cascade do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "gameweek_id"
    t.datetime "kickoff"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "scrapper_job_id"
  end

  create_table "gameweek_events", force: :cascade do |t|
    t.integer  "fixture_id"
    t.integer  "player_id"
    t.datetime "kickoff"
    t.integer  "minutes_player"
    t.integer  "goals_scored"
    t.integer  "assists"
    t.integer  "clean_sheets"
    t.integer  "goals_conceded"
    t.integer  "own_goals"
    t.integer  "penalties_saved"
    t.string   "penalties_missed"
    t.integer  "yellow_cards"
    t.integer  "red_cards"
    t.integer  "saves"
    t.integer  "bonus_points"
    t.integer  "esp"
    t.integer  "bps"
    t.integer  "net_transfers"
    t.integer  "value"
    t.integer  "point"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "gameweeks", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "scrapper_job_id"
  end

  create_table "player_fixture_performances", force: :cascade do |t|
    t.integer  "fixture_id"
    t.integer  "player_id"
    t.datetime "kickoff"
    t.integer  "minutes_player"
    t.integer  "goals_scored"
    t.integer  "assists"
    t.integer  "clean_sheets"
    t.integer  "goals_conceded"
    t.integer  "own_goals"
    t.integer  "penalties_saved"
    t.string   "penalties_missed"
    t.integer  "yellow_cards"
    t.integer  "red_cards"
    t.integer  "saves"
    t.integer  "bonus_points"
    t.integer  "esp"
    t.integer  "bps"
    t.integer  "net_transfers"
    t.integer  "value"
    t.integer  "point"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "scrapper_job_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "ff_id"
    t.string   "display_name"
    t.string   "position"
    t.string   "selected_by"
    t.integer  "total_points"
    t.integer  "team_code"
    t.string   "news"
    t.string   "status"
    t.integer  "code"
    t.string   "first_name"
    t.string   "second_name"
    t.integer  "now_cost"
    t.integer  "chance_of_playing_this_round"
    t.integer  "chance_of_playing_next_round"
    t.float    "value_form"
    t.float    "value_season"
    t.integer  "cost_change_start"
    t.integer  "cost_change_start_fall"
    t.boolean  "in_dreamteam"
    t.integer  "dreamteam_count"
    t.float    "selected_by_percent"
    t.float    "form"
    t.integer  "transfers_out"
    t.integer  "transfers_in"
    t.integer  "loans_in"
    t.integer  "loans_out"
    t.integer  "loaned_in"
    t.integer  "loaned_out"
    t.float    "points_per_game"
    t.float    "ep_this"
    t.float    "ep_next"
    t.boolean  "special"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "scrapper_job_id"
  end

  create_table "scrapper_jobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "code"
    t.integer  "external_id"
    t.string   "short_name"
    t.string   "name"
    t.string   "string"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
