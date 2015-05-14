json.array!(@schedule_locals) do |schedule_local|
  json.extract! schedule_local, :id, :name, :capacity, :faculty_id
  json.url schedule_local_url(schedule_local, format: :json)
end
