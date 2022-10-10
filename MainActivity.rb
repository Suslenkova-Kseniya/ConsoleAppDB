

print "Choose the action:\n
1. Puts user's information
2. Puts avatars
3. Puts pictures libraries\n
Print 0 to exit\n"

#dbconnect = DBConnect.new('root', 'ThisIsMyPassword!1', 'Users_Pictures')
#dbconnect.Connect
esc = false;
while !esc
  action = gets.chomp;
  case action
  when "0"
    puts "Exit?
        Y-yes N-no\n"
    answer = gets.chomp.upcase
    if answer=="Y" then esc=true
    end
  when "1"
    #dbconnect.GetUsersInfo
  when "2"
    #dbconnect.GetIconInfo
  when "3"
    #dbconnect.GetPicturesInfo
  else
    puts "Wrong input, try again, please.\n"
  end
end
