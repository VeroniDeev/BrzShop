class SlugConverter
  def self.deslugify(slug)
    deslugged_text = slug.tr('-', ' ')
    deslugged_text = deslugged_text.split
    if deslugged_text.length == 1
      return deslugged_text
    end
    deslugged_text = deslugged_text.map(&:capitalize).join(' ')
    deslugged_text
  end
end
