json.array!(@battles) do |battle|
  json.extract! battle, :id, :name, :about, :round_id, :tournament_id
  json.url battle_url(battle, format: :json)
end
