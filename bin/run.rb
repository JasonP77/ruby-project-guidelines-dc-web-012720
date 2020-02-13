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
        
        # for some reason these 2 lines get skipped???
        # find_game_by_category(customer_obj)
      else 
        puts "Password does not match"
        puts 'Insert your password.'
        password = gets.chomp
      end
    end
end 

def print_game(user, games)
  games.each_with_index{|game, index|
    puts "#{index+1}. #{game.name}"
    }
  end

def start_menu
  puts "Welcome"  
  
  puts "1. Search Game"
  puts "2. My Profile"
  puts "3. Game"
  puts "4. Exit"

  return gets.chomp.to_i
end 

def option1_menu1
  puts "Your options."

  puts "1. View all games"
  puts "2. Games by Rating"
  gets.chomp
end

def menu_selection(user)
  selection = start_menu
  if selection == 1
    option1_menu1
  elsif selection == 2
    puts "My Profile"
  elsif selection == 3
    puts "Games and Stats"
    # menu_selection(user)
  else selection == 4
  exit
  end
end

def list_of_all_games(user)
  print = print_game(user, Game.all)
end 

def search_game_menu(user)
  selection = list_of_all_games(user)
    if selection == 1
      puts "Games"
    elsif selection == 2
      puts "Games by Rating"
    else
      exit
    end
end
def get_ratings
  selection = Game.game_avg_desc
end

 ######################################

def find_game_by_category(user)
  puts "Type in game category you are interested in:"
  category = gets.chomp
  game = Game.all.select do |game|
    game.category == category
  end
  print_game(user, game)
end

def purchase(game)
  id = Game.find_by(name: game)
  Profile.find_or_create_by(customer_id: self.id, game_id: id.id, time: 0, money: id.price, review: "Write a review.") # create an object inside of terminal with variables, *Game Object and Customer Object call method
end

def run 
  user = username
  menu_selection(user)
  search_game_menu(user)
  get_ratings
  # find_game_by_category(user)
end

def exit
  
end 

run
