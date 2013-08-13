module StoryItemsDisplayTypes
  OBJECT_PHOTOS = :Object_photos
  FULL_BLEED_PHOTOS = :Full_bleed_photos

  def self.all
  	return [OBJECT_PHOTOS, FULL_BLEED_PHOTOS]
  end

  def self.all_to_s
  	return self.all.map { |cat| cat.to_s }
  end
end