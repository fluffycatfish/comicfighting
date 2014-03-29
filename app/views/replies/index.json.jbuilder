json.array!(@replies) do |reply|
  json.extract! reply, :id, :body, :content, :user_id, :battle_id
  json.url reply_url(reply, format: :json)
end
