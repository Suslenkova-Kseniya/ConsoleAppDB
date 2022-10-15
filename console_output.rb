class ConsoleOutput < Output
  def initialize(text)
    super
  end

  def write_info
    @text.each do |row|
      puts "%s %s %s" %[ row['id'], row['name'], row['price'] ]
    end
  end
end
