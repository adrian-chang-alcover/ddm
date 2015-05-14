json.array!(@schedule_turn_types) do |schedule_turn_type|
  json.extract! schedule_turn_type, :id, :short_name, :full_name
  json.url schedule_turn_type_url(schedule_turn_type, format: :json)
end
