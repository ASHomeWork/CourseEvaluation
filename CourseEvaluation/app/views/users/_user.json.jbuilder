json.extract! user, :id, :user_name, :password, :email, :power, :gender_id, :created_at, :updated_at
json.url user_url(user, format: :json)