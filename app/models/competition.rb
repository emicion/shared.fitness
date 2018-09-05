class Competition < ApplicationRecord
  belongs_to :owner, class_name: 'User', inverse_of: :comps

  has_many :challenges
  has_many :events, through: :challenges
  has_and_belongs_to_many :users

end

