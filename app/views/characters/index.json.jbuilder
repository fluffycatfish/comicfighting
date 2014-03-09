json.array!(@characters) do |character|
  json.extract! character, :id, :user_id, :name, :gender, :age, :race
  json.url character_url(character, format: :json)
end
