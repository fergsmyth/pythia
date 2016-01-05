class RemoveScrapperJobFromFixtures < ActiveRecord::Migration
  def change
    remove_column :fixtures, :scrapper_job_id, :integer
  end
end
