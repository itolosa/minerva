json.extract! document_category, :id, :name, :description, :created_at, :updated_at
json.url course_document_category_url(@course, document_category, format: :json)
