json.array!(@events) do |event|
  json.title event.name
  json.start event.deadline
  json.end event.deadline
  
  case event.event_type
  when 'レポート' then
  	json.color '#5CB3FF'
  when '小テスト' then
  	json.color '#59E817'
  when 'テスト' then
  	json.color '#F62217'
  else
  	json.color '#B6B6B4'
  end
  json.url event_url(event, format: :json)
end
