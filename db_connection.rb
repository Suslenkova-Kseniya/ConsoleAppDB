class DBConnection

  def initialize(db_user, db_pass, db_name)
    @db_name = db_name
    @db_user = db_user
    @db_pass = db_pass
    @db_host = "localhost"
  end

  def Connect
    begin
      @client = Mysql::Client.new(
        :host => @db_host,
        :username => @db_user,
        :password => @db_pass,
        :database => @db_name)
    rescue => exception
      puts "Exception: #{exception.message}"
    end
  end

  def GetUsersInfo
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

  def GetIconInfo
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

  def GetPicturesInfo
    begin
      results = @client.query("SSELECT ui.email, ui.nickname, up.title, up.create_date, p.url,
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
