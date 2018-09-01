json.extract! competition, :id, :owner_id, :name, :public, :start, :stop, :created_at, :updated_at
json.url competition_url(competition, format: :json)
