class AddScrapperIdToModels < ActiveRecord::Migration
  def change
    add_column :teams, :scrapper_id, :integer
    add_column :fixtures, :scrapper_id, :integer
    add_column :gameweeks, :scrapper_id, :integer
    add_column :players, :scrapper_id, :integer
    add_column :player_fixture_performances, :scrapper_id, :integer
  end
end
