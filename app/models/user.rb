class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  has_and_belongs_to_many :competitions
  has_many :comps, class_name: 'Competition', foreign_key: 'owner_id', dependent: :destroy, :inverse_of => :owner
  has_many :events
end
