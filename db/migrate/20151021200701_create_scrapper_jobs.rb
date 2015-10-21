class CreateScrapperJobs < ActiveRecord::Migration
  def change
    create_table :scrapper_jobs do |t|

      t.timestamps null: false
    end
  end
end
