json.extract! event, :id, :name, :description, :unit, :value_per_unit, :created_at, :updated_at
json.url event_url(event, format: :json)
