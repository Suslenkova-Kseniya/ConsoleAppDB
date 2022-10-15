class Output
  def self.output_types
    [ConsoleOutput, FileOutput]
  end

  def self.create(type_index)
    return output_types[type_index].new
  end

  def write_users_info
  end

  def write_icons_info
  end

  def write_pictures_info
  end
end
