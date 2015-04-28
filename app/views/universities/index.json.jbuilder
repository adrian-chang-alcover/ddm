json.array!(@universities) do |university|
  json.extract! university, :id, :short_name, :full_name
  json.url university_url(university, format: :json)
end
