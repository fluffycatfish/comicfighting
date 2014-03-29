json.array!(@battle_participations) do |battle_participation|
  json.extract! battle_participation, :id, :character_id, :battle_id, :status
  json.url battle_participation_url(battle_participation, format: :json)
end
