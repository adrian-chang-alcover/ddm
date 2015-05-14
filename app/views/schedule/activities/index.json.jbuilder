json.array!(@schedule_activities) do |schedule_activity|
  json.extract! schedule_activity, :id, :professor_id, :subject_id, :group_id, :local_id, :docent_day_id, :turn_id, :turn_type_id
  json.url schedule_activity_url(schedule_activity, format: :json)
end
