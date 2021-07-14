class Audience < ApplicationRecord
  has_many :campaigns
  
  validates_presence_of :name, :uid
  validates :name, :uid, uniqueness: true
end
