json.extract! event, :id, :title, :description, :starts_at, :ends_at, :user_id, :location, :created_at, :updated_at
json.url course_event_url(event, format: :json)
