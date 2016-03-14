class User < ActiveRecord::Base
  validates :username, uniqueness: true  
	validates :username, format: { without: /\s/ }
  validates :username, presence: true
  has_secure_password
  validates :password, length: { minimum: 5}, :on => :create
end
