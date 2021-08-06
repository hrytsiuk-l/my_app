class Audience < ApplicationRecord
  has_many :campaigns

  validates :name, :uid, presence: true 
  validates :name, :uid, uniqueness: true
end
