json.array!(@study_modalities) do |study_modality|
  json.extract! study_modality, :id, :short_name, :full_name
  json.url study_modality_url(study_modality, format: :json)
end
