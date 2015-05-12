json.array!(@schedule_docent_weeks) do |schedule_docent_week|
  json.extract! schedule_docent_week, :id, :number, :first_day
  json.url schedule_docent_week_url(schedule_docent_week, format: :json)
end
