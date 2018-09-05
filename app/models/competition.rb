class Competition < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :challenges
  has_and_belongs_to_many :users
    
end

