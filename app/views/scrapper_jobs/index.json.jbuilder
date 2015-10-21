json.array!(@scrapper_jobs) do |scrapper_job|
  json.extract! scrapper_job, :id
  json.url scrapper_job_url(scrapper_job, format: :json)
end
