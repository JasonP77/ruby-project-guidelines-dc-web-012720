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
################## Ratings
	def self.sortedg  # helper
		self.all.each do |game|
			game.rating
		end.sort_by{|t| -t[:rating]}
	end
	def self.games_desc  
		rtg = {}
		self.sortedg.each do |game|
			if game.rating 
				rtg[game.name] = game.rating  
			end
		end
		rtg
	end
############### Category 
	def self.sortedc  # helper
		self.all.each do |game|
			game.category
		end.sort_by{|t| t[:category]}
	end
	def self.game_cat_desc  
		rtg = {}
		self.sortedc.each do |game|
			if game.category 
				rtg[game.name] = game.category  
			end
		end
		rtg
	end

end

