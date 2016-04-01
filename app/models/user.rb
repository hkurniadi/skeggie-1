class User < ActiveRecord::Base
  validates :username, uniqueness: true  
	validates :username, format: { without: /\s/ }
  validates :username, presence: true
  has_secure_password
  validates :password, length: { minimum: 5}, :on => :create
	
	def User.digest(string)
	  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost:cost)
	end
end
