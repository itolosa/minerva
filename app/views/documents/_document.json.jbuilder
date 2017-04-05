json.extract! document, :id, :title, :description, :user_id, :document_category_id, :downloads_count, :created_at, :updated_at
json.url document_url(document, format: :json)
