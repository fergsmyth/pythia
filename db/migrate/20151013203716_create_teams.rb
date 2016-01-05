class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :code
      t.integer :external_id
      t.string :short_name
      t.string :name
      t.string :string
      t.timestamps null: false
    end
  end
end
