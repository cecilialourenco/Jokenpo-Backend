json.extract! user, :id, :name, :wins, :draws, :losses, :points, :created_at, :updated_at
json.url user_url(user, format: :json)
