json.array!(@career_accreditations) do |career_accreditation|
  json.extract! career_accreditation, :id, :career_id, :university_id, :year, :accreditation_category_id, :comments
  json.url career_accreditation_url(career_accreditation, format: :json)
end
