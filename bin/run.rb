require_relative '../config/environment'
require 'pry'

def username
    flag = false
    x = ""
    while flag == false             
      puts 'Insert your username:'
      user_name = gets.chomp
      x = Customer.find_by(username: user_name)
      if x.class == Customer
        #  binding.pry
        flag = true
        password(x)
      elsif x == nil
      puts "Invalid username"
    end
  end
end

def password(customer_obj)
    puts 'Insert your password.'
    password = gets.chomp
    until password == customer_obj.password
      if password == customer_obj.password
        puts "Good"
        find_game_by_category(customer_obj)
      else 
        puts "Password does not match"
        puts 'Insert your password.'
        password = gets.chomp
      end
    end
end 

def find_game_by_category(user)
  puts "Type in game category you are interested in:"
  category = gets.chomp
  game = Game.all.select do |game|
    game.category == category
  end
  print_game(user, game)
end

# 1.view profile (1. see all games 2. total money spent 3. total time spent)
# 2.purchase new game! (1. 2. 3.)
# 3.exit
def print_game(user, games)
games.each_with_index{|game, index|
  puts "#{index+1}. #{game.name}"
  }
end

def run 
  user = username
  # binding.pry
  # password(user)
  find_game_by_category(user)
end

run
