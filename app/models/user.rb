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

  def ransackable_attributes(auth_object = nil)
    %w(email)
  end

  def ransackable_associations(auth_object = nil)
    %w(email)
  end

  def ransortable_attributes(auth_object = nil)
    []
  end
end
