class Campaign < ApplicationRecord
  belongs_to :audience

  validates :name, :uid, presence: true
  validates :name, :uid, uniqueness: true
end
