class Customer < ActiveRecord::Base
	has_many :profiles
	has_many :games, through: :profiles


	def purchase(game)
		Profile.find_or_create_by(customer_id: self.id, game_id: game.id, time: 0, money: game.price, review: "write a review") # create an object inside of terminal with variables, *Game Object and Customer Object call method
	end
	
	# def add_game(game_name)
    #     game = Game.where(name: game_name)
    #     Profile.create(customer_id: self.id, game_id: game[0].id)
    # end


	
	def uninstall_game(game_id)
		var = Profile.all.select {|profile| profile.game_id == game_id}
		game = var.each {|profile| profile.destroy}

		# was oringally game = var.find{|profile| profile.customer_id == self.id }
		# game.destroy


        ## game = var.find_by(customer_id: self.id)
        
    end 


	#################################### this should be used for finding the games that belongs to owner
	# def owner_games									#dont need due to activerecord
	# 	Profile.all.select do  |profile|
	# 		 profile.customer_id == self.id
	# 	end 
	# end

	def find_owner_games
		self.games.map {|profile| profile.game.name}.uniq
	end 

	#####################################

	def find_owner_reviews
		#  self.owner_games.map {|profile| profile.review}   #same change made for 2 below
		
		self.profiles.map {|profile| profile.review}
	end 

	def find_owner_money_spent(game_id)
		game = self.profiles.select {|profile| profile.game_id == game_id}
		game.sum{|profile| profile.money}
		
	end 
	# self.owner_games.sum {|profile| profile.money}

	def find_owner_time_spent(game_id)

		game = self.profiles.select {|profile| profile.game_id == game_id}
		game.sum{|profile| profile.time}
		
		# #self.profiles.sum {|profile| profile.time}
		
		## self.owner_games.sum {|profile| profile.time}
	end 

	# def find_rating_sum(game_id)

	# 	game = self.profiles.select {|profile| profile.game_id == game_id}
	# 	game.sum{|profile| profile.rating}
	# end 
	
	
	def customer_games
		# profile = Profile.where(customer_id: self.id) 
		# profile.map{|profile| profile.game.name}.uniq

	      self.games.map{|game| game.name}.uniq

        # profile.map{|game| Game.find_by(id: game.game_id).name}
	end
	

	
end