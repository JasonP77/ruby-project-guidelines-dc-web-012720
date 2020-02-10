require_relative '../config/environment.rb'
require 'pry'


Customer.destroy_all
Game.destroy_all
Profile.destroy_all

cust1 = Customer.create(name:"Jason", username: "JasonJason")
cust2 = Customer.create(name:"Sonata", username: "SonataSonata")
cust3 = Customer.create(name:"Yo", username: "YoYo")


game1 = Game.create(name: "Fortnite", price: 10.00, rating: 4.9, category: "Action", company: "EpicGames")
game2 = Game.create(name: "Call of Duty", price: 7.99, rating:4.5, category:"Action", company:"Steam")
game3 = Game.create(name: "League of Legends", price: 0.00, rating: 4.0, category: "MOBA", company:"RiotGames")
game4 = Game.create(name: "Angry Birds", price: 0.00, rating: 1.0, category: "Strategy", company: "Apple")




pro1 = Profile.create(customer_id: cust1.id, game_id: game2.id, time: 2, review: "This game is great.")
pro2 = Profile.create(customer_id: cust3.id, game_id: game1.id, time: 10, review: "This game is amazing.")
pro3 = Profile.create(customer_id: cust2.id, game_id: game3.id, time: 7, review: "This game is okay.")
pro4 = Profile.create(customer_id: cust1.id, game_id: game4.id, time: 200, review: "Uninstall.")
pro5 = Profile.create(customer_id: cust3.id, game_id: game2.id, time: 59, review: "I love this game.")


# binding.pry
# 0
