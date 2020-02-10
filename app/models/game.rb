class Game < ActiveRecord::Base
	has_many :profiles
	has_many :customers, through: :profiles
end