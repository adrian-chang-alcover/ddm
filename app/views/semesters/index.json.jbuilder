json.array!(@semesters) do |semester|
  json.extract! semester, :id, :name, :year_id, :weeks, :begin_date, :end_date
  json.url semester_url(semester, format: :json)
end
