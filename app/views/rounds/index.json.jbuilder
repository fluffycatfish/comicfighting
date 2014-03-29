json.array!(@rounds) do |round|
  json.extract! round, :id, :round_no, :name, :about, :turn_duration, :start_date, :vote_date, :calc_date
  json.url round_url(round, format: :json)
end
