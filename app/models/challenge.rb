class Challenge < ApplicationRecord
  belongs_to :competition
  has_many :events
end
