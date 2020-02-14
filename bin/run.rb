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
def welcome
puts"                                       ,ggg,                                                                                "
puts"                                      dP""8I                             I8                            I8                   "
puts"                                    dP   88                             I8                            I8                   "
puts"                                   dP    88                          88888888                      88888888  gg            "
puts"                                 ,8'    88                             I8                            I8     ""            "
puts"                                  d88888888   gg,gggg,    gg,gggg,      I8      ,gggg,gg    ,g,       I8     gg     ,gggg, "
puts"                            __   ,8      88   I8P    Yb   I8P    Yb     I8     dP    Y8I   ,8'8,      I8     88    dP    Yb "
puts"                            dP  ,8P      Y8   I8'    ,8i  I8'    ,8i   ,I8,   i8'    ,8I  ,8'  Yb    ,I8,    88   i8'      "
puts"                            Yb,_,dP       `8b,,I8 _  ,d8' ,I8 _  ,d8'  ,d88b, ,d8,   ,d8b,,8'_   8)  ,d88b, _,88,_,d8,_    _"
puts"                              Y8P         `Y8PI8 YY88888PPI8 YY88888P88P Y88P Y8888P `Y8P'  YY8P8P88P  Y888P  Y8P  Y8888PP "
puts"                                              I8          I8                                                               "
puts"                                              I8          I8                                                               "
puts"                                              I8          I8                                                               "
puts"                                              I8          I8                                                               "
puts"                                              I8          I8                                                               "
puts"                                              I8          I8                                                               "

end
def menu_selection
  welcome
  selection = start_menu
  if selection == 1
    var1 = option1_menu
    if var1 == 1
      list_of_all_games(@@user)
      menu_selection
    elsif var1 == 2
      get_rating
      menu_selection
    elsif var1 == 3
      get_category
      menu_selection
    else var1 == 4
      menu_selection
    end
  elsif selection == 2
    var2 = option2_menu
    if var2 == 1
      puts "Uninstall"
      menu_selection
    elsif var2 == 2
      puts "Money"
      menu_selection
    elsif var2 == 3
      puts "Time"
      menu_selection
    else var2 == 4
      menu_selection
    end
  elsif selection == 3
    var3 = option3_menu
    if var3 == 1
      puts "All Reviews"
      # get_reviews
      menu_selection
    elsif var3 == 2
      puts "All Ratings"
      # game_rating(id)
      menu_selection
    elsif var3 == 3
      puts "ASCII BS"
      menu_selection
    else var3 == 4 
     menu_selection
    end
  end
  menu_selection
end 

def start_menu
  puts "1. Search Game"
  puts "2. My Profile"
  puts "3. Game"
  return gets.chomp.to_i
end 

def option1_menu
  puts "1. All games"
  puts "2. Games by Rating"
  puts "3. Games by Category"
  puts "4. Main Menu"
  return gets.chomp.to_i
end

def option2_menu
  puts "1. Uninstall"
  puts "2. Check amount of money you spent"
  puts "3. Check amount of time you spent"
  puts "4. Main Menu"
  return gets.chomp.to_i
end

def option3_menu
  puts "1. Reviews"
  puts "2. Rating"
  puts "3. Some ASCII BS"
  puts "4. Main Menu"
  return gets.chomp.to_i
end

@@selected_game = nil
def list_of_my_games(user)
    print = print_game(user, @@user.games.uniq)
    a = gets.chomp.to_i
    @@selected_game = @@user_game_list[a]
    selection = option2_menu
  if selection == 1
    puts "Game uninstalled."
    @@user.uninstall_game(@@selected_game.id) #grabs the selected game and then uninstalls 
  elsif selection == 2
    #money spent
    money = @@user.find_owner_money_spent(@@selected_game.id)
    puts "You have spent #{money} dollars."
  elsif selection == 3
    time = @@user.find_owner_time_spent(@@selected_game.id)
    puts "You have spent #{time} hours."
    #time spent
  else 
    # puts "Please make a valid selection."
    # menu_selection(user) 
  end
end 

@@user_game_list = {}
def print_game(user, games)
  games.each_with_index {|game, index|
    @@user_game_list[index+1] = game
    puts "#{index+1}. #{game.name}"
  }
end

def list_of_all_games(user)
  print = print_game(user, Game.all)
  return gets.chomp.to_i
end 

def get_rating
  Game.games_desc.each do |k, v| 
    puts "#{k} has a rating of #{v}."
  end
  # return gets.chomp.to_i
end

def get_category
  Game.game_cat_desc.each do |k, v|
    puts "#{k} - #{v}"
  end
  return gets.chomp.to_i
end

def exit
  # Do nothing.
end 

def run 
  username
end

run
