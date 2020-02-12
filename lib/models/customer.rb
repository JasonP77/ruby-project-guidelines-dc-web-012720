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
        game = Profile.find_by(customer_id: cust3.id, game_id: game1.id, time: 10, money: 5.00, review: "This game is amazing.")
        game.destroy 
    end 

	def owner_games
		Profile.all.select do  |profile|
			 profile.customer_id == self.id
		end 
	end

	def find_owner_games
		self.owner_games.map {|profile| profile.game.name}
	end 


	#or? Customer.profiles.each do |profile| 
		#profile.game
		#end 	
		
	
	def customer_games
        profile = Profile.where(customer_id: self.id) 
        profile.map{|game| Game.find_by(id: game.game_id).name}
	end
	
end