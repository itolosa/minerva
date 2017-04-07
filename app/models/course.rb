class Course < ApplicationRecord
  has_many :events
  has_many :documents
  has_many :moderations
  belongs_to :user
  has_many :document_categories
  has_many :moderators, through: :moderations, source: :user
end
