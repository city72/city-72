module StoryItemsDisplayTypes
  COLUMN_3_SQUARE = "3 columns (square images)"
  COLUMN_2_SQUARE = "2 columns (square images)"
  COLUMN_2_BLEED = "2 columns (full bleed images)"

  def self.all
  	return [COLUMN_3_SQUARE, COLUMN_2_SQUARE, COLUMN_2_BLEED]
  end

  def self.all_to_s
  	return self.all.map { |cat| cat.to_s }
  end
end