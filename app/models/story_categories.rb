module StoryCategories
	TSUNAMI_OR_FLOOD = "Tsunami or Flood" 
  BIOHAZARD_OR_RADIATION = "Biohazard or Radiation"
  EARTHQUAKE = "Earthquake"
  HURRICANE_OR_TORNADO = "Hurricane or Tornado"
  TERRORIST_ATTACK = "Terrorist Atack"
  CONNECTION_STORY = "Connection Story"
  OTHER_EMERGENCY = "Other Emergency"

  def self.all
  	return [TSUNAMI_OR_FLOOD, BIOHAZARD_OR_RADIATION, EARTHQUAKE, HURRICANE_OR_TORNADO,
  					TERRORIST_ATTACK, CONNECTION_STORY, OTHER_EMERGENCY]
  end

  def self.all_to_s
  	return self.all.map { |cat| cat.to_s }
  end
end