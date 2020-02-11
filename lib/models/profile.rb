class Profile < ActiveRecord::Base
	belongs_to :customer
	belongs_to :game

	
	
	def all_games_for_player

	end 

	def total_spent
		
	end
	
	
	


end