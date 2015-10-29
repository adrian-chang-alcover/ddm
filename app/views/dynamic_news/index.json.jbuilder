json.array!(@dynamic_news) do |dynamic_news|
  json.extract! dynamic_news, :id, :title, :description
  json.url dynamic_news_url(dynamic_news, format: :json)
end
