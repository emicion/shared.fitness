json.extract! event, :id, :user_id, :challenge_id, :performed, :value, :created_at, :updated_at
json.url event_url(event, format: :json)
