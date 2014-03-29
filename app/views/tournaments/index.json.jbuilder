json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :name, :about, :round_no, :state
  json.url tournament_url(tournament, format: :json)
end
