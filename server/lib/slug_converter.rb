class SlugConverter
  def self.deslugify(input_string)
    return input_string.gsub('-', ' ')
  end
end
