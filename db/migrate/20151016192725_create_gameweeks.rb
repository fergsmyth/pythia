class CreateGameweeks < ActiveRecord::Migration
  def change
    create_table :gameweeks do |t|
      t.integer :week     
      t.timestamps null: false
    end
  end
end
