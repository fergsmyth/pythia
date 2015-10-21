class AddScrapperIdToModels < ActiveRecord::Migration
  def change
    add_column :fixtures, :scrapper_job_id, :integer
    add_column :gameweeks, :scrapper_job_id, :integer
    add_column :players, :scrapper_job_id, :integer
    add_column :player_fixture_performances, :scrapper_job_id, :integer
  end
end
