json.array!(@schedule_groups) do |schedule_group|
  json.extract! schedule_group, :id, :name, :capacity, :year_id
  json.url schedule_group_url(schedule_group, format: :json)
end
