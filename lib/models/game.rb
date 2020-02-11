require 'pry'

class Game < ActiveRecord::Base
	has_many :profiles
	has_many :customers, through: :profiles

	def highest_rating
		Game.all.max_by{ |game| game.rating}
	end 

	def lowest_rating
		Game.all.min_by{ |game| game.rating}
	end 


	def self.all_games           #helper method
		arr = []
		self.all.each { |game| arr << game.name}
		arr.sort
	end 

	



end

