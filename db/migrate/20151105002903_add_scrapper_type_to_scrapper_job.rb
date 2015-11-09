class AddScrapperTypeToScrapperJob < ActiveRecord::Migration
  def change
    add_column :scrapper_jobs, :scrapper_type, :string
  end
end
