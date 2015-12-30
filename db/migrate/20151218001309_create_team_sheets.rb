class CreateTeamSheets < ActiveRecord::Migration
  def change
    create_table :team_sheets do |t|
      t.string :name
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
