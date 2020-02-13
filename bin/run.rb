require_relative '../config/environment'
require 'pry'

@@user = nil

def username
    flag = false
    x = ""
    while flag == false             
      puts 'Insert your username:'                          #if doesnt have right username it will keep repeating, if it finds a match it goes to 
                                                            # line 17 for pw
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
        puts "Password does not match"
        puts 'Insert your password.'
        password = gets.chomp
      end
    
      @@user = customer_obj
      menu_selection
end 

def menu_selection

    selection = start_menu
    if selection == 1
      list_of_all_games(@@user)
    elsif selection == 2
      #my profile/library
        # puts  @@user.find_owner_games
        list_of_my_games(@@user)
    #   puts @@user.customer_games
    elsif selection == 3
      exit
    else 
      menu_selection(user) 
    end
  end 



def start_menu
  puts "Select from menu."
  puts "1. Search Game"
  puts "2. My Profile"
  puts "3. Game"
  return gets.chomp.to_i
end 

def option1_menu
  puts "Your options."
  puts "1. View all games"
  puts "2. Above AVG"
  puts "3. Below AVG"
  return gets.chomp.to_i
end

###
def option2_menu
    puts "Select from menu."
    puts "1. Uninstall"
    puts "2. Check amount of money you spent"
    puts "3. Check amount of time you spent"
    return gets.chomp.to_i
  end
@@selected_game = nil
def list_of_my_games(user)
    print = print_game(user, @@user.games)
    a = gets.chomp.to_i
    @@selected_game = @@user_game_list[a]
    selection = option2_menu
  if selection == 1
    puts "game uninstalled."
    @@user.uninstall_game(@@selected_game.id) #grabs the selected game and then uninstalls 
  elsif selection == 2
    #my profile/library
    puts "list of games (above AVG)"
  elsif selection == 3
    puts "list of games (below AVG)"
  else 
    menu_selection(user) 
  end
end 


###

def list_of_all_games(user)
  print = print_game(user, Game.all)
  gets.chomp

  selection = option1_menu
  if selection == 1
    puts "testing purchase"
  elsif selection == 2
    #my profile/library
    puts "list of games (above AVG)"
  elsif selection == 3
    puts "list of games (below AVG)"
  else 
    menu_selection(user) 
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
@@user_game_list = {}
def print_game(user, games)
games.each_with_index{|game, index|     #puts the game of the user in a hash and prints it like 1. game_name
  @@user_game_list[index+1] = game
  puts "#{index+1}. #{game.name}"
  }
 
  # selection = gets.chomp
  # if selection == 1
  # end
end    #need to make a global variable to have a hash like {1:game, 2:game2} this is for @@selected_game.id

def exit

end 

def run 
  username
#   menu_selection
#   find_game_by_category($user)
end

run
