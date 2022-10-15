class FileOutput < Output

  def write_users_info(info)
    file = File.new("./files/users.csv", "w:UTF-8")
    info.each do |row|
      file.puts(row['email']+';'+row['nickname']+';'+row['first_name']+';'+row['last_name']+';'+row['birth_date']+';'+row['sex'])
    end
    file.close
  end

  def write_icons_info(info)
    file = File.new("./files/icons.csv", "w:UTF-8")
    info.each do |row|
      file.puts(row['email']+';'+row['nickname']+';'+row['title']+';'+row['create_date']+';'+row['url']+';'+row['alt_text'])
    end
    file.close
  end

  def write_pictures_info(info)
    file = File.new("./files/pictures.csv", "w:UTF-8")
    info.each do |row|
      file.puts(row['email']+';'+row['nickname']+';'+row['title']+';'+row['create_date']+';'+row['url']+';'+row['alt_text'])
    end
    file.close
  end
end
