class Audience < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
  validates_presence_of :name, :uid
  validates :name, :uid, uniqueness: true
=======
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
>>>>>>> fixed typos
=======
  validates_presence_of :name, :uid
  validates :name, :uid, uniqueness: true
>>>>>>> generated model campaign
end
