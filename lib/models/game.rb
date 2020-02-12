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

	def self.sortedg  # helper
		self.all.each do |game|
			game.rating
		end.sort_by{|t| -t[:rating]}
	end
	def self.game_avg_desc  
		arr = []
		rtg = {}
		self.sortedg.each do |game|
			if game.rating 
				arr << rtg["name"] = game.name
				arr << rtg["rating"] = game.rating
			end
		end
		arr
	end
end

