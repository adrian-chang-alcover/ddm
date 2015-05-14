json.array!(@schedule_professors) do |schedule_professor|
  json.extract! schedule_professor, :id, :name, :email, :scientific_degree_id, :docent_category_id, :faculty_id
  json.url schedule_professor_url(schedule_professor, format: :json)
end
