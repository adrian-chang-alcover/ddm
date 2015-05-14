json.array!(@schedule_docent_days) do |schedule_docent_day|
  json.extract! schedule_docent_day, :id, :day, :docent_week_id
  json.url schedule_docent_day_url(schedule_docent_day, format: :json)
end
