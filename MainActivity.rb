require_relative 'db_connection'

print "Choose the action:\n
1. Puts user's information
2. Puts avatars
3. Puts pictures libraries\n
Print 0 to exit\n"

db_connect = DBConnection.new('pictures_db', 'justuser', 'ThisIsMyPassword!1')
db_connect.connect
db_connect.initialize_app

esc = true
while esc
  action = gets.chomp
  case action
  when "0"
    esc = false
  when "1"
    db_connect.get_users_info
  when "2"
    db_connect.get_icon_info
  when "3"
    db_connect.get_pictures_info
  else
    puts "Wrong input, try again, please.\n"
  end
end
