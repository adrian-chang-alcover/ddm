json.array!(@schedule_turns) do |schedule_turn|
  json.extract! schedule_turn, :id, :name, :start_time, :end_time
  json.url schedule_turn_url(schedule_turn, format: :json)
end
