class DocumentCategory < ApplicationRecord
  belongs_to :user
  has_many :documents
  belongs_to :course
end
