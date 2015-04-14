json.array!(@accreditation_categories) do |accreditation_category|
  json.extract! accreditation_category, :id, :name
  json.url accreditation_category_url(accreditation_category, format: :json)
end
