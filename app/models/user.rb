class User < ApplicationRecord
  has_secure_password

	validates :first_name, presence: true
	validates :last_name, presence: true

	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 5 }
end
