class Audience < ApplicationRecord
  validates_presence_of :name, :uid
  validates :name, :uid, uniqueness: true
end
