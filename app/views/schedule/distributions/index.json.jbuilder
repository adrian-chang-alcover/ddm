json.array!(@schedule_distributions) do |schedule_distribution|
  json.extract! schedule_distribution, :id, :professor_id, :group_id, :subject_id
  json.url schedule_distribution_url(schedule_distribution, format: :json)
end
