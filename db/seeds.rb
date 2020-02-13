require_relative '../config/environment.rb'
require 'pry'


Customer.destroy_all
Game.destroy_all
Profile.destroy_all

cust1 = Customer.find_or_create_by(name:"Jason", username: "JasonJason", password: "jasonp", email: "jasonp@yahoo.com") 
cust2 = Customer.find_or_create_by(name:"Sonata", username: "SonataSonata", password: "123123", email: "sonataa@yahoo.com")
cust3 = Customer.find_or_create_by(name:"Yo", username: "YoYo", password: "123qwe", email: "yop@yahoo.com")


game1 = Game.find_or_create_by(name: "Fortnite", price: 10.00, rating: 4.9, category: "Action", company: "EpicGames")
game2 = Game.find_or_create_by(name: "Call of Duty", price: 7.99, rating: 5.0 , category:"Action", company:"Activision")
game3 = Game.find_or_create_by(name: "League of Legends", price: 0.00, rating: 4.0, category: "MOBA", company:"RiotGames")
game4 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "RovioEntertainment")
game5 = Game.find_or_create_by(name: "Dota", price: 0.00, rating: 3.5, category: "MOBA", company: "Valve")




#when testing in pry can just do something like pro1 = _ to get whatever i typed in before in pry

pro1 = Profile.find_or_create_by(customer_id: cust1.id, game_id: game2.id, time: 20, money: 3.00, review: "This game is great.") 
pro2 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game1.id, time: 10, money: 5.07, review: "This game is amazing.")
pro3 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game3.id, time: 79, money: 3.70, review: "Uninstall.")
pro4 = Profile.find_or_create_by(customer_id: cust1.id, game_id: game4.id, time: 200, money: 4.00, review: "This game is okay.") 
pro5 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
pro6 = Profile.find_or_create_by(customer_id: cust1.id, game_id: game4.id, time: 500, money: 20.00, review: "") 
pro7 = Profile.find_or_create_by(customer_id: cust1.id, game_id: game1.id, time: 66, money: 17.30, review: "") 
pro8 = Profile.find_or_create_by(customer_id: cust2.id, game_id: game5.id, time: 59, money: 0.00, review: "Okay.")
pro9 = Profile.find_or_create_by(customer_id: cust2.id, game_id: game4.id, time: 11, money: 0.30, review: "My go to game!")


#Profile.games to just find all the games that a customer has

#changed money value

# binding.pry
# 0


#if profile has a game id = string_name of the game, destroy the game 