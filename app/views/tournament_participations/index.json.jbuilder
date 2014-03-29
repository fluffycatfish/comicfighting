json.array!(@tournament_participations) do |tournament_participation|
  json.extract! tournament_participation, :id, :character_id, :tournament_id
  json.url tournament_participation_url(tournament_participation, format: :json)
end
