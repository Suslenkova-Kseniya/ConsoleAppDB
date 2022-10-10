require_relative 'db_connection'

print "Choose the action:\n
1. Puts user's information
2. Puts avatars
3. Puts pictures libraries\n
Print 0 to exit\n"

dbconnect = DBConnection.new('root', 'ThisIsMyPassword!1', 'Users_Pictures')
dbconnect.connect
dbconnect.initialize_app

esc = true
while esc
  action = gets.chomp;
  case action
  when "0"
    puts "Exit?
      Y-yes N-no\n"
    answer = gets.chomp.upcase
    esc=false if (answer=="Y")
  when "1"
    dbconnect.get_users_info
  when "2"
    dbconnect.get_icon_info
  when "3"
    dbconnect.get_pictures_info
  else
    puts "Wrong input, try again, please.\n"
  end
end
