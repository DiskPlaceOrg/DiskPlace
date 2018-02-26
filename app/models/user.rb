class User < ApplicationRecord
  has_secure_password
  has_many :resources
  validates :nick_name,
            presence: true,
            uniqueness: true,
            length: { minimum: 5 }

  validates :email,
            presence: true,
            uniqueness: true,
            length: { minimum: 5 },
            format: {
                with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }

end
