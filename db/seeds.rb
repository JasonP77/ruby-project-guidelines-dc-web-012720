require_relative '../config/environment.rb'
require 'pry'


Customer.destroy_all
Game.destroy_all
Profile.destroy_all

cust1 = Customer.find_or_create_by(name:"Jason", username: "JasonJason", password: "jasonp", email: "jasonp@yahoo.com") 
cust2 = Customer.find_or_create_by(name:"Sonata", username: "SonataSonata", password: "123123", email: "sonataa@yahoo.com")
cust3 = Customer.find_or_create_by(name:"Yo", username: "YoYo", password: "123qwe", email: "yop@yahoo.com")


game1 = Game.find_or_create_by(name: "Fortnite", price: 10.00, rating: 4.9, category: "Action", company: "EpicGames")
game2 = Game.find_or_create_by(name: "Call of Duty", price: 7.99, rating: 5.0 , category:"Action", company:"Steam")
game3 = Game.find_or_create_by(name: "League of Legends", price: 0.00, rating: 4.0, category: "MOBA", company:"RiotGames")
game4 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game5 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game6 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game7 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game8 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game9 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game10 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game11 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game12 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game13 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game14 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game15 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game16 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")
# game17 = Game.find_or_create_by(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")





pro1 = Profile.find_or_create_by(customer_id: cust1.id, game_id: game2.id, time: 2, money: 3.00, review: "This game is great.") 
pro2 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game1.id, time: 10, money: 5.00, review: "This game is amazing.")
pro3 = Profile.find_or_create_by(customer_id: cust2.id, game_id: game3.id, time: 7, money: 3.00, review: "This game is okay.")
pro4 = Profile.find_or_create_by(customer_id: cust1.id, game_id: game4.id, time: 200, money: 4.00, review: "Uninstall.") 
pro5 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro6 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro7 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro8 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro9 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro10 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro12 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro13 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro14 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro15 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro16 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro17 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro18 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro19 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro20 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro21 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")
# pro22 = Profile.find_or_create_by(customer_id: cust3.id, game_id: game2.id, time: 59, money: 0.00, review: "I love this game.")


#Profile.games to just find all the games that a customer has

#changed money value

# binding.pry

# 0
