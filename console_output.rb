class ConsoleOutput < Output
  def write_users_info(info)
    info.each do |row|
      puts "Email: %s\nNickname: %s\nFirst name: %s\nLast name: %s\nBirth date: %s\nSex: %s\n" %[ row['email'],
              row['nickname'], row['first_name'], row['last_name'], row['birth_date'], row['sex'] ]
    end
  end

  def write_icons_info(info)
    info.each do |row|
      puts "Email: %s\nNickname: %s\nTitle: %s\nCreate date: %s\nUrl: %s\nAlt text: %s\n" %[ row['email'],
            row['nickname'], row['title'], row['create_date'], row['url'], row['alt_text'] ]
    end
  end

  def write_pictures_info(info)
    info.each do |row|
      puts "Email: %s\nNickname: %s\nTitle: %s\nCreate date: %s\nUrl: %s\nAlt text: %s\n" %[ row['email'],
            row['nickname'], row['title'], row['create_date'], row['url'], row['alt_text'] ]
      end
  end
end
