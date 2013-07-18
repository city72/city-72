module Categories
  ESSENTIAL = :Essential
  USEFUL = :Useful
  PERSONAL = :Personal

  def self.all
  	return [ESSENTIAL, USEFUL, PERSONAL]
  end

  def self.all_to_s
  	return self.all.map { |cat| cat.to_s }
  end
end