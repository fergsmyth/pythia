rails generate scaffold Player team_id:integer ff_id:integer display_name:string position:string selected_by:string total_point:integer team_code:integer news:string status:string code:integer first_name:string second_name:string now_cost:integer chance_of_playing_this_round:integer chance_of_playing_next_round:integer value_form:float value_season:float cost_change_start:integer cost_change_start_fall:integer in_dreamteam:boolean dreamteam_count:integer selected_by_percent:float form:float transfers_out:integer transfers_in:integer loans_in:integer loans_out:integer loaned_in:integer loaned_out:integer points_per_game:float ep_this:float ep_next:float special:boolean

rails generate scaffold Fixture home_team_id:integer away_team_id:integer gameweek_id:integer kickoff:datetime

