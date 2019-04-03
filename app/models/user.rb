class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	validates :email, presence: true
	validates :email, uniqueness: true
	validates :password, length: { minimum: 8 },unless: -> { password.nil? }
	validates :password, presence: true, if: -> {id.nil?}
	has_one :customer 
end
