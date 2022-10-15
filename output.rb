class Output
  def initialize(text)
    @text = text
  end

  def self.output_types
    return [console, file]
  end

  def self.create(type_index)
    return output_types[type_index].new
  end

  def write_info

  end
end
