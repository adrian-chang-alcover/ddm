json.array!(@subjects) do |subject|
  json.extract! subject, :id, :short_name, :full_name, :descipline_id, :semester_id, :hours, :evaluation_type_id
  json.url subject_url(subject, format: :json)
end
