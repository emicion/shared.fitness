class Competition < ApplicationRecord
  belongs_to :owner, class_name: 'User', inverse_of: :comps

  has_many :challenges
  has_many :events, through: :challenges
  has_and_belongs_to_many :users


  NON_VALIDATABLE_ATTRS = ["owner_id", "owner", "public", "id", "created_at", "updated_at"]
  VALIDATABLE_ATTRS = Competition.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}

  validates_presence_of VALIDATABLE_ATTRS

  scope :anyone, -> { where(public: true) }
end

