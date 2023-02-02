class User < ApplicationRecord
	validates :email, uniqueness: true, presence: true
	validates :name, uniqueness: true, presence: true
	has_secure_password	

	def fancy_comp(x,y)
		x+y
	end
end
