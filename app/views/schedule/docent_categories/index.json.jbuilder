json.array!(@schedule_docent_categories) do |schedule_docent_category|
  json.extract! schedule_docent_category, :id, :short_name, :full_name
  json.url schedule_docent_category_url(schedule_docent_category, format: :json)
end
