json.array!(@years) do |year|
  json.extract! year, :id, :name, :career_id, :study_plan_id
  json.url year_url(year, format: :json)
end
