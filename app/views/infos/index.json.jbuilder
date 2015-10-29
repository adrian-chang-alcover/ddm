json.array!(@infos) do |info|
  json.extract! info, :id, :title, :description, :user_id
  json.url info_url(info, format: :json)
end
