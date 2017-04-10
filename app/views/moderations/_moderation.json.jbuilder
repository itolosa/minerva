json.extract! moderation, :id, :user_id, :course_id, :created_at, :updated_at
json.url course_moderation_url(moderation, format: :json)
