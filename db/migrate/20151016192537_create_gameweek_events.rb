class CreateGameweekEvents < ActiveRecord::Migration
  def change
    create_table :gameweek_events do |t|
      t.integer :fixture_id
      t.integer :player_id
      t.datetime :kickoff
      t.integer :minutes_player
      t.integer :goals_scored
      t.integer :assists
      t.integer :clean_sheets
      t.integer :goals_conceded
      t.integer :own_goals
      t.integer :penalties_saved
      t.string :penalties_missed
      t.integer :yellow_cards
      t.integer :red_cards
      t.integer :saves
      t.integer :bonus_points
      t.integer :esp
      t.integer :bps
      t.integer :net_transfers
      t.integer :value
      t.integer :point

      t.timestamps null: false
    end
  end
end
