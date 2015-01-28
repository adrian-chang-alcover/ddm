json.array!(@subjects) do |subject|
  json.extract! subject, :id, :short_name, :full_name, :discipline_id, :semester_id, :class_hours_1, :class_hours_2, :practical_hours, :evaluation_type_id, :curriculum_type_id, :dictum_or_resoluteness, :number
  json.url subject_url(subject, format: :json)
end
