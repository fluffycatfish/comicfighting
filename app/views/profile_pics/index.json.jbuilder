json.array!(@profile_pics) do |profile_pic|
  json.extract! profile_pic, :id, :user_id, :avatar
  json.url profile_pic_url(profile_pic, format: :json)
end
