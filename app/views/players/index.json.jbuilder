json.array!(@players) do |player|
  json.extract! player, :id, :team_id, :ff_id, :display_name, :position, :selected_by, :total_point, :team_code, :news, :status, :code, :first_name, :second_name, :now_cost, :chance_of_playing_this_round, :chance_of_playing_next_round, :value_form, :value_season, :cost_change_start, :cost_change_start_fall, :in_dreamteam, :dreamteam_count, :selected_by_percent, :form, :transfers_out, :transfers_in, :loans_in, :loans_out, :loaned_in, :loaned_out, :points_per_game, :ep_this, :ep_next, :special
  json.url player_url(player, format: :json)
end
