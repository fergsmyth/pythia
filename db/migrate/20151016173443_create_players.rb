class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :team_id
      t.integer :ff_id
      t.string :display_name
      t.string :position
      t.float :selected_by
      t.integer :total_points
      t.integer :team_code
      t.string :news
      t.string :status
      t.integer :code
      t.string :first_name
      t.string :second_name
      t.integer :now_cost
      t.integer :chance_of_playing_this_round
      t.integer :chance_of_playing_next_round
      t.float :value_form
      t.float :value_season
      t.float :cost_change_start
      t.float :cost_change_start_fall
      t.boolean :in_dreamteam
      t.integer :dreamteam_count
      t.float :selected_by_percent
      t.float :form
      t.integer :transfers_out
      t.integer :transfers_in
      t.integer :loans_in
      t.integer :loans_out
      t.integer :loaned_in
      t.integer :loaned_out
      t.float :points_per_game
      t.float :ep_this
      t.float :ep_next
      t.boolean :special

      t.timestamps null: false
    end
  end
end
