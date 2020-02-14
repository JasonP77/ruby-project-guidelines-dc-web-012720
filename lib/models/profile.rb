class Profile < ActiveRecord::Base
	belongs_to :customer
	belongs_to :game

	def self.games_owned  

        frequency = Hash.new(0)
        self.all.each do |profile|
            
            game_id = profile.game.name 
            if frequency[game_id]
                frequency[game_id] += 1
            else 
                frequency[game_id] = 1 
            end 
        end 
        return frequency.sort_by {|title, num| num}.reverse 
	end 
	def self.all_review(user)
        profile = Profile.all.select {|profile| profile.customer_id == user}
        profile.map {|profile| profile.review}
    end
end