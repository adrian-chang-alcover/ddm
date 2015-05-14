json.array!(@schedule_p1s) do |schedule_p1|
  json.extract! schedule_p1, :id, :subject_id, :docent_week_id, :turn_type_id, :name, :number
  json.url schedule_p1_url(schedule_p1, format: :json)
end
