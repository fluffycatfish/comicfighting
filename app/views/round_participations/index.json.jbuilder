json.array!(@round_participations) do |round_participation|
  json.extract! round_participation, :id, :round_id, :character_id, :point, :late_deduction
  json.url round_participation_url(round_participation, format: :json)
end
