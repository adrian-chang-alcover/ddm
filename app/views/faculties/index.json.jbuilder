json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :short_name, :full_name, :dean
  json.url faculty_url(faculty, format: :json)
end
