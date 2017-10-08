class User < ApplicationRecord
  validates :name, 
    presence: true,
    uniqueness: {case_sensitive: false},
    length: {minimum: 3, maximum: 25}

  has_secure_password
  has_many :articles
end
