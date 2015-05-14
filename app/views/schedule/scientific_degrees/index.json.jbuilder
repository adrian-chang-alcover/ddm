json.array!(@schedule_scientific_degrees) do |schedule_scientific_degree|
  json.extract! schedule_scientific_degree, :id, :short_name, :full_name
  json.url schedule_scientific_degree_url(schedule_scientific_degree, format: :json)
end
