class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :gameweek_id
      t.integer :home_team_sheet_id
      t.integer :away_team_sheet_id
      t.datetime :kickoff

      t.timestamps null: false
    end
  end
end
