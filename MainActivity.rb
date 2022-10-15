require_relative 'db_connection'
require_relative 'output'
require_relative 'console_output'
require_relative 'file_output'

db_connect = DBConnection.new('pictures_db', 'justuser', 'ThisIsMyPassword!1')
db_connect.connect
db_connect.initialize_app

esc = true
while esc
  puts "Where to write the result?"

  choices = Output.output_types
  choice = -1
  until choice >= 0 && choice < choices.size
    choices.each_with_index do |type, index|
      puts "\t#{index}. #{type}"
    end
    choice = gets.chomp.to_i
  end
  entry = Output.create(choice)

  print "Choose the action:\n
  1. Puts user's information
  2. Puts avatars
  3. Puts pictures libraries\n
  Print 0 to exit\n"

  action = gets.chomp
  case action
  when "0"
    esc = false
  when "1"
    entry.write_users_info(db_connect.get_users_info)
  when "2"
    entry.write_icons_info(db_connect.get_icon_info)
  when "3"
    entry.write_pictures_info(db_connect.get_pictures_info)
  else
    puts "Wrong input, try again, please.\n"
  end
end
