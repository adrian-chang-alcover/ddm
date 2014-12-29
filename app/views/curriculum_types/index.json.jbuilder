json.array!(@curriculum_types) do |curriculum_type|
  json.extract! curriculum_type, :id, :name
  json.url curriculum_type_url(curriculum_type, format: :json)
end
