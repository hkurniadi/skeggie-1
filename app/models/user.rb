class User < ActiveRecord::Base
  validates :username, uniqueness: true  
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 5 }
  
  has_secure_password
end
