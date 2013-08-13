module PersonTypes
  DISASTER_SURVIVOR = "Disaster Survivor"
  COMMUNITY_HUB = "Community Hub"

  def self.all
  	return [DISASTER_SURVIVOR, COMMUNITY_HUB]
  end

  def self.all_to_s
  	return self.all.map { |cat| cat.to_s }
  end
end