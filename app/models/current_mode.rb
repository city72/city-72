class CurrentMode < ActiveRecord::Base
  attr_accessible :mode

  def self.isCrisisMode
  	CurrentMode.first.mode
  end

  def self.isPreviewMode
  	!self.isCrisisMode
  end

  def self.getCurrentMode
  	Mode.where(em_mode: isCrisisMode )
  end

end
