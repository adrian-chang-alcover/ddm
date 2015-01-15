json.array!(@disciplines) do |discipline|
  json.extract! discipline, :id, :name, :career_id, :number
  json.url discipline_url(discipline, format: :json)
end
