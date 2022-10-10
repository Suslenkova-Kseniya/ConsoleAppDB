require 'mysql2'
class DBConnection

  def initialize(db_user, db_pass, db_name)
    @db_name = db_name
    @db_user = db_user
    @db_pass = db_pass
    @db_host = "localhost"
  end

  def connect
    begin
      @client = Mysql2::Client.new(
        :host => @db_host,
        :username => @db_user,
        :password => @db_pass,
        :database => @db_name)
    rescue => exception
      puts "Exception: #{exception.message}"
    end
  end

  def initialize_app
    table_names= ['personal_info', 'pictures', 'user_info', 'users_pictures']
    table_names.each do |s|
      table_check(s)
      clear_table(s)
      file_path = "./resources/#{s}.csv"
      fill_table(file_path, s)
    end
  end

  def table_check(table)
    result = @client.query("SHOW TABLES LIKE #{table}")
    if (result == '')
      case table
      when 'personal_info'
        @client.query("CREATE TABLE personal_info (user_id int not null,
                       first_name varchar(50), last_name varchar(50),
                       birth_date DATE, sex char, CONSTRAINT personal_info_user_id_fk
                       FOREIGN KEY (user_id) REFERENCES user_info (user_id));")
      when 'pictures'
        @client.query("CREATE TABLE pictures (pic_id INT not null auto_increment,
                       url varchar(100), alt_text blob, PRIMARY KEY (pic_id));")
      when 'user_info'
        @client.query("CREATE TABLE user_info (user_id INT NOT NULL AUTO_INCREMENT,
                       email varchar(50), nickname varchar(30), PRIMARY KEY (user_id));")
      when 'users_pictures'
        @client.query("CREATE TABLE users_pictures (pic_id INT NOT NULL, user_id INT NOT NULL,
                       title varchar(50), create_date DATE, picture_type varchar(50),CONSTRAINT
                       pictures_pic_id_fk FOREIGN KEY (pic_id) REFERENCES pictures (pic_id),
                       CONSTRAINT user_info_user_id_fk FOREIGN KEY (user_id) REFERENCES user_info (user_id));")
      end
    end
  end

  def clear_table(table)
    @client.query("DELETE FROM #{table};")
  end

  def fill_table(path, table)
    if File.exist?(path)
      f = File.new(path, "r:UTF-8")
      lines = f.readlines
      f.close
      lines.each do |l|
        elements = l.split(";")
        case table
        when 'personal_info'
          user_id = elements[0].to_i
          first_name = elements[1]
          last_name = elements[2]
          birth_date = elements[3]
          sex = elements[4]
          @client.query("INSERT INTO personal_info (user_id, first_name, last_name, birth_date, sex)
                         VALUES (#{user_id}, /'#{first_name}/', /'#{last_name}/', /'#{birth_date}/', #{sex}/');")
        when 'pictures'
          url = elements[0]
          alt_text = elements[1]
          @client.query("INSERT INTO pictures (url, alt_text) VALUES (/'#{url}/', /'#{alt_text}/');")
        when 'user_info'
          email = elements[0]
          nickname = elements[1]
          @client.query("INSERT INTO user_info (email, nickname) VALUES (/'#{email}/', /'#{nickname}/');")
        when 'users_pictures'
          pic_id = elements[0].to_i
          user_id = elements[1].to_i
          title = elements[2]
          create_date = elements[3]
          picture_type = elements[4]
          @client.query("INSERT INTO users_pictures (pic_id, user_id, title, create_date, picture_type)
                         VALUES (#{pic_id}, #{user_id}, /'#{title}/', /'#{create_date}/', /'#{picture_type}/');")
        end
      end
    else
      puts "File doesn't exist!"
    end
  end

  def get_users_info
    begin
      results = @client.query("SELECT ui.email, ui.nickname, pi.first_name, pi.last_name, pi.birth_date,
            pi.sex FROM user_info ui NATURAL JOIN personal_info pi;")
      results.each do |row|
        puts row
      end
    rescue => exception
      puts "Exception: #{exception.message}"
    end
  end

  def get_icon_info
    begin
      results = @client.query("SELECT ui.email, ui.nickname, up.title, up.create_date, p.url,
            p.alt_text FROM users_pictures up JOIN user_info ui ON ui.user_id=up.user_id AND
            picture_type='icon' JOIN pictures p ON up.pic_id=p.pic_id;")
      results.each do |row|
        puts row
      end
    rescue => exception
      puts "Exception: #{exception.message}"
    end
  end

  def get_pictures_info
    begin
      results = @client.query("SELECT ui.email, ui.nickname, up.title, up.create_date, p.url,
            p.alt_text FROM users_pictures up JOIN user_info ui ON ui.user_id=up.user_id AND
            picture_type='regular' JOIN pictures p ON up.pic_id=p.pic_id;")
      results.each do |row|
        puts row
      end
    rescue => exception
      puts "Exception: #{exception}"
    end
  end
end
