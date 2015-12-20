class CreateTeamSheets < ActiveRecord::Migration
  def change
    create_table :team_sheets do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
