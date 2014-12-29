json.array!(@subjects) do |subject|
  json.extract! subject, :id, :short_name, :full_name, :discipline_id, :semester_id, :class_hours, :practical_hours, :evaluation_type_id, :curriculum_type_id, :dictum_or_resoluteness
  json.url subject_url(subject, format: :json)
end
