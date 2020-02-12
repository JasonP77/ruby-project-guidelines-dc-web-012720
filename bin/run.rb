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
        # puts "Welcome"  
        # for some reason these 2 lines get skipped???
        # find_game_by_category(customer_obj)
      else 
        puts "Password does not match"
        puts 'Insert your password.'
        password = gets.chomp
      end
    end
end 

def start_menu
  puts "Select from menu."
  puts "1. Search Game"
  puts "2. My Profile"
  puts "3. Game"
  return gets.chomp.to_i
end 


def menu_selection(user)
  selection = start_menu
  if selection == 1
    option1_menu1
    # list_of_all_games(user)
  elsif selection == 2
    #my profile/library
  elsif selection == 3
    exit
  else 
    menu_selection(user) 
  end
end 

def option1_menu1
  puts "Please choose one."
  puts "1. GameList"
  puts "2. Above AVG"
  puts "3. Below AVG"
end

def option1_menu1_selection(user)
  selection = gets.chomp.to_i
  if selection == 1
    option1_menu2
  elsif selection == 2
    puts "games (above AVG)"
  elsif selection == 3
    puts "games (below AVG)"
  else 
    menu_selection(user) 
  end
end

def option1_menu2 
  puts "Please choose one."
  puts "1. Purchase"
  puts "2. Menu"
end

def option1_menu2_selection(user)
  selection = gets.chomp.to_i
  if selection == 1
    puts "Okie"
  elsif selection == 2
    menu_selection(user) 
  else 
    menu_selection(user)  
  end
end


# def list_of_all_games(user)
#   print = print_game(user, Game.all)
#   gets.chomp
#   selection = option1_menu2
#   if selection == 1
#     puts "purchase testing"
#   elsif selection == 2
#     menu_selection(user)
#   else 
#     menu_selection(user) 
#   end
# end 


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
  # selection = gets.chomp
  # if selection == 1
  # end
end

def exit

end 

def run 
  user = username
  menu_selection(user)
  option1_menu1_selection(user)
  option1_menu2_selection(user)
  # find_game_by_category(user)
end

run
