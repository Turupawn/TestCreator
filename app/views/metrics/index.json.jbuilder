json.array!(@metrics) do |metric|
  json.extract! metric, :id, :name, :test_id
  json.url metric_url(metric, format: :json)
end
