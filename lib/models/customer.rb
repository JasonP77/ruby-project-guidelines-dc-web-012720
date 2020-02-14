class Customer < ActiveRecord::Base
	has_many :profiles
	has_many :games, through: :profiles

	def purchase(game_id)
		news = Profile.find_or_create_by(customer_id: self.id, game_id: game.id, time: 0, money: game.price, review: "write a review") # create an object inside of terminal with variables, *Game Object and Customer Object call method
		news
	end
	
	# def add_game(game_name)
    #     game = Game.where(name: game_name)
    #     Profile.create(customer_id: self.id, game_id: game[0].id)
    # end

	def uninstall_game(game_id)
        game = Profile.find_by(customer_id: cust3.id, game_id: game1.id, time: 10, money: 5.00, review: "This game is amazing.")
        game.destroy 
    end 
end