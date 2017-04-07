class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :documents
  has_many :events
  has_many :moderations
  has_many :moderated_courses, through: :moderations, source: :course
  has_many :document_categories
end
