module StoryItemsTitles
  HOW_I_AM_PREPARED = "How I'm prepared:"
  WHAT_SHOULD_I_OFFER = "What I would offer:"
  WHAT_ARE_MY_NETWORKS = "What are my networks?"

  def self.all
  	return [HOW_I_AM_PREPARED, WHAT_SHOULD_I_OFFER, WHAT_ARE_MY_NETWORKS]
  end

  def self.all_to_s
  	return self.all.map { |cat| cat.to_s }
  end
end