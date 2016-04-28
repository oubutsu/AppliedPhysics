json.array!(@events) do |event|
  json.extract! event, :id, :name, :deadline, :place, :comment, :event_type
  json.url event_url(event, format: :json)
end
