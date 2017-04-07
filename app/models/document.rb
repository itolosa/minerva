class Document < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :document_category
  has_attached_file :content
end
