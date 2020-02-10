require_relative '../config/environment.rb'
require 'pry'


cust1 = Customer.create(name:"Jason", username: "JasonJason")
cust2 = Customer.create(name:"Sonata", username: "SonataSonata")
cust3 = Customer.create(name:"Yo", username: "YoYo")

game1 = Game.create(name: "Fortnite", price: 10.00, rating: 4.9, category: "Action", company: "EpicGames")
game2 = Game.create(name: "Call of Duty", price: 7.99, rating:4.5, category:"Action", company:"Steam")
game3 = Game.create(name: "League of Legends", price: 0.00, rating: 4.0, category: "MOBA", company:"RiotGames")

# profile = Profile.create(cust1)
# binding.pry
# 0
1