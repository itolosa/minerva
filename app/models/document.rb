class Document < ApplicationRecord
  belongs_to :user
  belongs_to :document_category
  has_attached_file :content
end
