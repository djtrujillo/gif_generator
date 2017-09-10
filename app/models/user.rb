class User < ApplicationRecord
  has_many :favorites
  has_secure_password
  validates :username, presence: true, uniqueness: true

  enum role: %w(default admin)
end
