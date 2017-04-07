class Moderation < ApplicationRecord
  belongs_to :user, inverse_of: :moderations
  belongs_to :course, inverse_of: :moderations
end
