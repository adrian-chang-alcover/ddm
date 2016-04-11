json.array!(@audits) do |audit|
  json.extract! audit, :id, :item_type, :item_id, :event, :whodunnit, :object
  json.url audit_url(audit, format: :json)
end
