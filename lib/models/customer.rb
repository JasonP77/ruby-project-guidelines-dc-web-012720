class Customer < ActiveRecord::Base
	has_many :profiles
	has_many :games, through: :profiles


	def purchase(game)
		Profile.find_or_create_by(customer_id: self.id, game_id: game.id, time: 0, money: game.price, review: "write a review") # create an object inside of terminal with variables, *Game Object and Customer Object call method
	end
end