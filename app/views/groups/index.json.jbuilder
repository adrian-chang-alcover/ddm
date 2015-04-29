json.array!(@groups) do |group|
  json.extract! group, :id, :name, :capacity, :year_id
  json.url group_url(group, format: :json)
end
