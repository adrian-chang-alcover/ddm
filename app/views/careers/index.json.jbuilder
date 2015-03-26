json.array!(@careers) do |career|
  json.extract! career, :id, :short_name, :full_name, :faculty, :study_modality
  json.url career_url(career, format: :json)
end
