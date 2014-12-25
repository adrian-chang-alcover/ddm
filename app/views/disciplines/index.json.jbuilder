json.array!(@disciplines) do |discipline|
  json.extract! discipline, :id, :name, :career_id
  json.url discipline_url(discipline, format: :json)
end
