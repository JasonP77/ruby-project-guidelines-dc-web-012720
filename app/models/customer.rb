class Customer < ActiveRecord::Base
	has_many :profiles
	has_many :games, through: :profiles
end