json.array!(@turns) do |turn|
  json.extract! turn, :id, :name, :start_time, :end_time
  json.url turn_url(turn, format: :json)
end
