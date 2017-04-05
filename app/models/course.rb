class Course < ApplicationRecord
  has_many :events
  has_many :documents
end
